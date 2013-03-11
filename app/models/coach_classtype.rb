class CoachClasstype < ActiveRecord::Base
  attr_accessible :coach_id, :classtype_id
  belongs_to :coach
  belongs_to :classtype
  
end
