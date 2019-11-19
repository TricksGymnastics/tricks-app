class CoachLocation < ApplicationRecord
  #attr_accessible :coach_id, :location_id
  belongs_to :coach
  belongs_to :location
  
end
