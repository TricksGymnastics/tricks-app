class StaticController < ApplicationController

  before_filter :set_variables

  def set_variables
    @bgc_yellow = "#F2E300"
    @bgc_green = "#5FC916"
    @bgc_orange = "#ff9933"
    @bgc_pink = "#ec1e79"
    @bgc_blue = "#223d99"
    @bgc_purple = "#8a09db"

    @twenty_years = "none"
    @jr_login = "none"

    @tricksu_password = false
  end

  def index
    @kid_quote = KidQuote.find(:all).sample(n=3)
    @live_promos = PromoSlide.where(live: true).all(order: 'sort_order')
    #render :layout => "random_quote"
  end

  def site_comments
    @comment = Comment.where(score: 7..10).sample(n=6)
  end

  def app_landing
    render :layout => "application"
  end

  def datenight
    @datenight = Datenight.first
  end

  def registration
    @schedules = Schedule.joins(:level).location_search(params[:location]).level_search(params[:level]).age_search(params[:age])
  end

end
