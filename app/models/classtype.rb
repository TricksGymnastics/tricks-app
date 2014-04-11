class Classtype < ActiveRecord::Base
	
	has_many :schedules
	has_many :levels
	# has_many :coaches
  has_many :absents

	# has_many :coach_classtypes
  has_many :coaches, through: :coach_classtypes

end
