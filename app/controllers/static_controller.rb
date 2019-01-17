class StaticController < ApplicationController
  def index
    @live_promos = PromoSlide.where(live: true).order(:sort_order)
  end

  def site_comments
    @comment = Comment.where(score: 8..10).sample(n=4)
  end

  def datenight
    @datenight = Datenight.first
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
  end
end
