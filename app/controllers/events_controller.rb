class EventsController < ApplicationController
  def index
    @past_events = Event.past
    @upcoming_events = Event.upcoming
  end

  def new
    @event = Event.new
  end

  def create
    if current_user
      @event = current_user.created_events.build(event_params)
      @event.save
      redirect_to user_path(current_user)
    else
      flash[:alert] = 'Please login'
      redirect_to login_path
    end
  end

  def show
    @event = Event.find(params[:id])
    @event_attendees = @event.attendees
    @user = current_user
  end

  def edit
    @event = Event.find(params[:id])
    if current_user
      @event.attendees.push(current_user)
      redirect_to event_path(@event)
    else
      flash[:notice] = 'Please login'
      store_location
      redirect_to login_path
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :date)
  end
end
