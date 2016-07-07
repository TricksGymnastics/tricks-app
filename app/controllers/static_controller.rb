class StaticController < ApplicationController
  def index
    @kid_quote = KidQuote.all.sample(n=3)
    @live_promos = PromoSlide.where(live: true).order(:sort_order)
    # @live_promos.each do |promo|
    @live_promos.to_ary.delete_if do |promo|
      if promo.data_type == "html"
        false
      elsif !promo.image.file.exists?
        true # Make sure the if statement returns true, so it gets marked for deletion
      end
    end
    # end
    
    #render :layout => "random_quote"
  end

  def site_comments
    @comment = Comment.where(score: 8..10).sample(n=4)
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
    @dance = Level.joins(:classtype).where("classtypes.name = 'Dance'").where(sort_order: 400..499)
  end
  
  def preschool_dance
    @preschool_dance = Level.joins(:classtype).where("classtypes.name = 'Dance'").where(sort_order: 300..399)
  end

  def swim
    @swim = Level.joins(:classtype).where("classtypes.name = 'Swim'").where("levels.levelname != 'Open By Request'")
    # @swim.delete_if   {|level| level.levelname == "Open By Request"}
  end

end
