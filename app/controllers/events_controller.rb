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
    @event = Event.find(params[:id])
    @user = current_user
  end

  def edit
    @event = Event.find(params[:id])
    @event.attendees.push(current_user)
    redirect_to event_path(@event)
  end

  private 

  def event_params
    params.require(:event).permit(:title, :description, :date)
  end

end
