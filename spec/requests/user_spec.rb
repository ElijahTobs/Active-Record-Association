require 'rails_helper'

RSpec.describe 'User Management', type: :request do
  let(:signup){
    get '/signup'
    expect(response).to render_template(:new)
    post '/users', params: { user: { name: @name } }
  }
  let(:event){ Event.create(title: 'This is a valid title') }

  context 'when user signs up with valid name' do
    it "logs in user and loads root" do
      @name = 'Lucas'
      signup
      user = User.find_by(name: 'Lucas')
      expect(response).to redirect_to('/events')
      expect(session[:user_id]).to eql(user.id)
    end
  end
  
  context 'when user tries to signup with invalid name' do
    it "flashes \'existing name\' error and reloads the page" do
      User.create(name: 'Elijah')
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
      expect(event.attendees).to include(User.find_by(name: 'Lucas'))
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