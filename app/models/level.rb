class Level < ActiveRecord::Base
	has_many :schedules, dependent: :destroy
	belongs_to :classtype
	validates_uniqueness_of :levelname
	validates_presence_of :levelname, :length, :price, :age

	default_scope :order => 'levels.order' # assuming the column name is order

end
