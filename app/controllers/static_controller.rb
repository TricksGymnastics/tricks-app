class StaticController < ApplicationController

  before_filter :set_variables

  def set_variables
    @bgc_yellow = "#fbed20"
    @bgc_green = "#79c843"
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
    @live_promos = PromoSlide.where(live: true)
    #render :layout => "random_quote"
  end

  def site_comments
    @comment = Comment.where(score: 7..10).sample(n=6)
  end

  def app_landing
    render :layout => "application"
  end

end
