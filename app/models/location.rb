class Location < ActiveRecord::Base
  attr_accessible :name
  has_many :coach_locations
  has_many :coaches, through: :coach_locations
end
