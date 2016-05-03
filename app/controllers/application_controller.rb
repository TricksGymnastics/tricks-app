class ApplicationController < ActionController::Base
 
  protect_from_forgery with: :exception
  helper_method :current_user

  before_filter :set_variables

  def set_variables
    @bgc_yellow = "#FFF55E" #"#F2E300"
    @bgc_green = "#9CE568" #"#5FC916"
    @bgc_orange = "#FFAB58" #"#ff9933"
    @bgc_pink = "#F473AB" #"#ec1e79"
    @bgc_blue = "#6074B7" #"#223d99"
    @bgc_purple = "#A851DF" #"#8a09db"

    @twenty_years = "none"
    @jr_login = "none"

    @needs_stripe = false
    @tricksu_password = false
    
    @newsletter = WebsitePdf.where(:file_name => "Tricks_Newsletter").first
    @reg_form = WebsitePdf.where(:file_name => "Tricks_Registration_Form").first
    @release_form = WebsitePdf.where(:file_name => "Tricks_Release_Form").first
    @family_rules = WebsitePdf.where(:file_name => "Tricks_Family_Rules").first
    @class_sessions = WebsitePdf.where(:file_name => "Tricks_Class_Sessions").first
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
