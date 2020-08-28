require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user){ User.create(name: 'Capybara') }
  
  describe 'users#new (signup)', type: :feature do
    let(:fill_form){ user;visit 'signup';fill_in 'user_name', with: @name;click_on 'Create Account' }

    context 'when user signs up with invalid name' do
      it "flashes an error" do
        @name = 'Capybara'
        fill_form
        expect(page).to have_content "User already registered. Use another name."
      end

      it 'reloads the same page' do
        fill_form
        expect(page).to have_content "Sign Up"
      end
    end

    context 'when user tries to signup without a name' do
      it 'flashes an error' do
        @name = ''
        fill_form
        expect(page).to have_content "Please enter name"
      end

      it 'stays in the same page' do
        fill_form
        expect(page).to have_content "Sign Up"
      end
    end
  end
  
  describe 'signin functionality', type: :feature do
    
  end

end

# RSpec.feature 'Forms', type: :feature do
#   let(:user){User.create(name: 'Capybara')}
#   describe 'signup' do
#     context 'user signs up with invalid name' do
#       it "flashes an error" do
#         user
#         # visit 'signup'
#         fill_in 'user_name', with: 'Capybara'
#         click_on 'Create Account'

#         expect(page).to have_content "User already registered. Use another name."
#       end
#     end
#   end
# end