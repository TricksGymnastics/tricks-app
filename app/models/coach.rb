class Coach < ActiveRecord::Base
	attr_accessible :image, :firstname, :lastname, :gender, :location_ids, :level_ids, :experience, :fav_event, :fav_skill, :fav_food, :disney_char, :advice, :birthdate, :startdate, :remove_image
	has_many :schedules

	has_many :coach_levels
	has_many :levels, through: :coach_levels

	has_many :coach_locations
	has_many :locations, through: :coach_locations

	validates :firstname,:presence => {:message => "cannot be blank."}, :allow_blank => true,:format => /^[A-Za-z\d_-]+$/
	validates :lastname,:presence => {:message => "cannot be blank."}, :allow_blank => true,:format => /^[A-Za-z\d_-]+$/
	validates_presence_of :gender, :location_ids, :level_ids
	
	mount_uploader :image, CoachImageUploader

	default_scope :order => 'coaches.id'


	def self.location_search(location_search)
  		if location_search
    		where('name ILIKE ?', "%#{location_search}%")
 		else
 			scoped
 		end
	end

end
