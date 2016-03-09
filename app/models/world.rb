class World < ActiveRecord::Base
  #attr_accessible :date, :first_name, :image, :last_name, :location

  validates_presence_of :first_name, :last_name, :image, :location, :date

  mount_uploader :image, WorldImageUploader
end
