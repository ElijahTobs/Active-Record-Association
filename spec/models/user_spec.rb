require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user){User.create(name: 'Capybara')}
  describe 'signup functionality', type: :feature do
    context 'when user signs up with invalid name' do
      it "flashes an error" do
        user
        visit 'signup'
        fill_in 'user_name', with: 'Capybara'
        click_on 'Create Account'

        expect(page).to have_content "User already registered. Use another name."
      end

      it 'stays in the same page' do
        user
        visit 'signup'
        fill_in 'user_name', with: ''
        click_on 'Create Account'
        expect(page).to have_content "Sign Up"
      end
    end

    context 'when user tries to signup without a name' do
      
      it 'flashes an error' do
        user
        visit 'signup'
        fill_in 'user_name', with: ''
        click_on 'Create Account'
        expect(page).to have_content "Please enter name"
      end

      it 'stays in the same page' do
        user
        visit 'signup'
        fill_in 'user_name', with: ''
        click_on 'Create Account'
        expect(page).to have_content "Sign Up"
      end
    end
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