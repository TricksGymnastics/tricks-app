class StaticController < ApplicationController
  def index
    @kid_quote = KidQuote.all.sample(n=3)
    @live_promos = PromoSlide.where(live: true).order(:sort_order)
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

  def gymnastics
    @school_aged = Level.joins(:classtype).where("classtypes.name = 'Gymnastics'")
  end

  def tumblebunnies
    @tumblebunnies = Level.joins(:classtype).where("classtypes.name = 'Tumblebunnies'")
  end

  def tag
    @tag = Level.joins(:classtype).where("classtypes.name = 'TAG'")
  end

  def dance
    @dance = Level.joins(:classtype).where("classtypes.name = 'Dance'")
  end

  def swim
    @swim = Level.joins(:classtype).where("classtypes.name = 'Swim'").where("levels.levelname != 'Open By Request'")
    # @swim.delete_if   {|level| level.levelname == "Open By Request"}
  end

end
