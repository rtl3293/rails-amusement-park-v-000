class UsersController < ApplicationController
  before_action :current_user, only: [:show, :edit, :update]
  before_action :logged_in_redirect, only: [:new]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      # binding.pry
      redirect_to user_path(@user)
    else
      render 'users/new.html.erb'
    end
  end

  def show
    redirect_to root_path if !logged_in?
  end


  private

  def user_params
    params.require(:user).permit(:name, :password, :happiness, :nausea, :tickets, :height, :admin)
  end

end
