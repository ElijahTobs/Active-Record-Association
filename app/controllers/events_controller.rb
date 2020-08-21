class EventsController < ApplicationController
  def index
    @events = Event.all 
  end
  
  def new
    @event = Event.new
  end

  def create
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
  end
end
