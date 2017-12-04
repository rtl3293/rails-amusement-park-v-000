class UsersController < ApplicationController
  before_action :current_user, only: [:show, :edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      binding.pry
      redirect_to user_path(@user)
    else
      render 'users/new.html.erb'
    end
  end

  def show

  end


  private

  def user_params
    params.require(:user).permit(:name, :password, :happiness, :nausea, :tickets, :height, :admin)
  end

  def current_user
    @user = User.find_by(id: session[:user_id]) if session.include? :user_id
  end
end
