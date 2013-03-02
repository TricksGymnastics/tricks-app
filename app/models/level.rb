class Level < ActiveRecord::Base
	has_many :schedules, dependent: :destroy
	has_many :coach_levels
	has_many :coaches, through: :coach_levels
	belongs_to :classtype
	validates_uniqueness_of :levelname
	validates_presence_of :classtype_id, :levelname, :length, :price, :age
	
	default_scope :order => 'levels.order' # assuming the column name is order

end
