class Classtype < ActiveRecord::Base
	has_many :schedules
	has_many :levels

end
