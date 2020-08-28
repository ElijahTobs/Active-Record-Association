require 'rails_helper'

RSpec.describe 'Event Management', type: :request do
  let(:new_user_event){
    get '/users/:user_id/events/new'
    expect(response).to render_template(:new)
    post '/events', params: { event: { title: @title, description: @description } }
  }

  context '' do
    
  end


end