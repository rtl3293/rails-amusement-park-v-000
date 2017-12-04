class SessionsController < ApplicationController
  before_action :logged_in_redirect, only: [:new]

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: user_params[:name])
    if @user && @user.authenticate(user_params[:password])
      set_user(@user)
      redirect_to user_path(@user)
    else
      render 'sessions/new.html.erb'
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

  private

  def logged_in_redirect
    binding.pry
    redirect_to user_path(current_user) if logged_in?
  end

  def user_params
    params.require(:user)
  end
end
