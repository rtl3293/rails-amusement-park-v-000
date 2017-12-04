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
    binding.pry
  end


  private

  def user_params
    params.require(:user).permit(:name, :password, :happiness, :nausea, :tickets, :height, :admin)
  end

end
