class Level < ActiveRecord::Base
	has_many :schedules, dependent: :destroy
	has_many :coach_levels
	has_many :coaches, through: :coach_levels
  has_many :absents
	belongs_to :classtype
	validates_uniqueness_of :levelname, :jack_rabbit_name
	validates_presence_of :classtype_id, :levelname, :length, :price, :age, :gender, :sort_order, :jack_rabbit_name
  attr_accessible :description, :short_description, :video_url 
	
	default_scope :order => 'levels.sort_order' # assuming the column name is order

  # def to_param
  #   self.levelname
  # end

end
