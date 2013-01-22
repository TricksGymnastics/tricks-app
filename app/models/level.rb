class Level < ActiveRecord::Base
	has_many :schedules, dependent: :destroy
	validates_uniqueness_of :levelname
	validates_presence_of :class_type, :levelname, :length, :price, :age

	default_scope :order => 'levels.order' # assuming the column name is order

end
