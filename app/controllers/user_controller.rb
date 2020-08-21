class UserController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @user.created_events
  end
end
