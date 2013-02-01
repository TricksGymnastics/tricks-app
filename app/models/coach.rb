class Coach < ActiveRecord::Base
	attr_accessible :image, :firstname, :lastname, :gender, :location, :level_ids, :experience, :fav_event, :fav_skill, :fav_food, :disney_char, :advice, :birthdate, :startdate
	has_many :schedules
	has_many :coach_levels
	has_many :levels, through: :coach_levels
	mount_uploader :image, CoachImageUploader

	default_scope :order => 'coaches.id'

end
