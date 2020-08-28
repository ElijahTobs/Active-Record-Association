require 'rails_helper'

RSpec.describe 'Event Management', type: :request do
  let(:signup) do
    get '/signup'
    expect(response).to render_template(:new)
    post '/users', params: { user: { name: 'Lucas' } }
  end
  let(:new_user_event) do
    get '/events/new'
    expect(response).to render_template(:new)
    post '/events', params: { event: { title: 'This is a valid title', description: 'description' } }
  end

  context 'when users tries to access user#show not logged in' do
    it 'redirects to login_url' do
      get '/users/1'
      expect(response).to redirect_to('/login')
    end
  end

  context 'user clicks on Submit button to Create Event' do
    it 'redirects to user#show' do
      signup
      new_user_event
      expect(response).to redirect_to("/users/#{session[:user_id]}")
    end
  end
end
