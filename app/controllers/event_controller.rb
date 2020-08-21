class EventController < ApplicationController
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
