require 'rails_helper'
require 'sessions_helper'

RSpec.configure do |c|
  c.include SessionsHelper
end

RSpec.describe 'User Management', type: :request do
  let(:signup) do
    get '/signup'
    expect(response).to render_template(:new)
    post '/users', params: { user: { name: @name } }
  end
  let(:event) { Event.create(title: 'This is a valid title') }
  let(:user_existent) { User.create(name: 'Elijah') }

  context 'when user signs up with valid name' do
    it 'logs in user and loads root' do
      @name = 'Lucas'
      signup
      expect(response).to redirect_to('/events')
      expect(session[:user_name]).to eql(current_user.name)
    end

    it 'shows up sign out link', type: :feature do
      visit '/signup'
      fill_in 'user_name', with: 'Lucas'
      click_on 'commit'
      expect(page).to have_content('Sign Out')
    end

    it 'hides sign in and sign up links', type: :feature do
      visit '/signup'
      fill_in 'user_name', with: 'Lucas'
      click_on 'commit'
      expect(page).to_not have_content('Sign In')
      expect(page).to_not have_content('Sign Up')
    end
  end

  context 'when user tries to signup with invalid name' do
    it "flashes \'existing name\' error and reloads the page" do
      user_existent
      @name = 'Elijah'
      signup
      expect(response).to redirect_to('/signup')
      expect(flash[:alert]).to eql('User already registered. Use another name.')
    end
  end

  context 'when user tries to signup without name' do
    it "flashes \'empty name\' error and reloads the page" do
      @name = ''
      signup
      expect(response).to redirect_to('/signup')
      expect(flash[:alert]).to eql('Please enter name')
    end
  end

  context 'when user tries to attend event while not logged in' do
    it 'redirects to login_path' do
      event
      get '/events/1/edit'
      expect(response).to redirect_to('/login')
    end
  end

  context 'when user attends to event while logged in' do
    it 'attends event' do
      event
      @name = 'Lucas'
      signup
      get '/events/1/edit'
      expect(event.attendees).to include(current_user)
    end

    it 'reloads page' do
      event
      @name = 'Lucas'
      signup
      get '/events/1/edit'
      expect(response).to redirect_to('/events/1')
    end
  end
end
