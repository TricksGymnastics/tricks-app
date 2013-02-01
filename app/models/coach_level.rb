class CoachLevel < ActiveRecord::Base
  attr_accessible :coach_id, :level_id
  belongs_to :coach
  belongs_to :level
  
end
