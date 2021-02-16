class StaticController < ApplicationController
  def index
    @live_promos = PromoSlide.where(live: true).order(:sort_order)
  end

  def site_comments
    @comments = Comment.all
    if params.has_key?(:type)
      @comments = @comments.where(activity: params[:type])
    end

    @comments = @comments.where(score: 8..10).order(Arel.sql('RANDOM()')).page(params[:page]).per(4)
  end

  def gymnastics
    @school_aged = Level.joins(:classtype).where("classtypes.name = 'Gymnastics'").where(sort_order: 1..249).where(active: true)
  end

  def tumblebunnies
    @tumblebunnies = Level.joins(:classtype).where("classtypes.name = 'Tumblebunnies'").where(active: true)
  end

  def tag
    @tag = Level.joins(:classtype).where("classtypes.name = 'TAG'").where(active: true)
  end

  def dance
    @dance = Level.joins(:classtype).where("classtypes.name = 'Dance'").where(sort_order: 400..499).where(active: true)
  end
  
  def preschool_dance
    @preschool_dance = Level.joins(:classtype).where("classtypes.name = 'Dance'").where(sort_order: 300..399).where(active: true)
  end

  def swim
    @swim = Level.joins(:classtype).where("classtypes.name = 'Swim'").where("levels.levelname != 'Open By Request'").where(active: true)
  end

  def cheer
    @school_aged = Level.joins(:classtype).where("classtypes.name = 'Gymnastics'").where(sort_order: 250..260).where(active: true)
  end

  def recital_info
    @website_pdf = WebsitePdf.where(:file_name => "Winter_Dance_Recital").first
  end
end
