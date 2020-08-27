class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      flash[:success] = 'Logged in successfully!'
      redirect_to events_path
    else
      render 'new'
    end
  end

  def show
    @created_events = current_user.created_events
    @attended_events = current_user.attended_events.past
    @events_yet_to_attend = current_user.attended_events.upcoming
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
