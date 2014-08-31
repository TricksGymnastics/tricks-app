class TricksUCategory < ActiveRecord::Base
  has_many :tricks_u_videos
  attr_accessible :title, :weight, :hidden
end
