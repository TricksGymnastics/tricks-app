class ApplicationController < ActionController::Base
  
  protect_from_forgery
  helper_method :current_user

  before_filter :set_variables

  def set_variables
    @needs_stripe = false
  end

  rescue_from CanCan::AccessDenied do |exception|
  	flash[:error] = "You are not authorized to view this page. Please Log In"
  	redirect_to login_path
  end

	private
	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
	
end
