class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :logged_in?

  def set_user(user)
    session[:user_id] = user.id
  end

  def current_user
    @user = User.find_by(id: session[:user_id]) if logged_in?
  end

  def logged_in?
    session.include? :user_id
  end

  def logged_in_redirect
    redirect_to user_path(current_user) if logged_in?
  end
end
