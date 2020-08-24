class EventsController < ApplicationController
  def index
    @events = Event.all 
  end
  
  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    @event.save
    redirect_to user_path(current_user)
  end

  def show
    @user = Event.find(params[:id]).creator
  end

  private 

  def event_params
    params.require(:event).permit(:title, :description)
  end
end
