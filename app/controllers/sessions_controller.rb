class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:session][:name])
    if @user
      log_in @user
      redirect_back_or @user
      flash.now[:notice] = 'Logged in successfully!'
    else
      flash.now[:alert] = 'Invalid Name'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
