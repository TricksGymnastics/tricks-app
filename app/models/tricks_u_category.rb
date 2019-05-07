class TricksUCategory < ActiveRecord::Base
  has_many :tricks_u_videos
  accepts_nested_attributes_for :tricks_u_videos
  #attr_accessible :title, :weight, :hidden
end
