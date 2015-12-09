class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :require_login
  helper_method :current_user

  private
  def not_authenticated
  	redirect_to login_path, alert: "Please login first"
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      return nil
  end
end


  def authenticate_user
    unless current_user
      redirect_to '/login'
    end
  end

end
