class Location < ApplicationRecord
  #attr_accessible :name
  has_many :coach_locations
  has_many :coaches, through: :coach_locations
  
  #belongs_to :locatable, :polymorphic => true
  
  #this goes in the model of the thing that has locations
  #has_many :locations, :as => :locatable
  #accepts_nested_attributes_for :locations
end
