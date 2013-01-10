class Schedule < ActiveRecord::Base
	belongs_to :level

	validates_presence_of :level, :day, :time, :teacher, :gender, :class_type, :location

end
