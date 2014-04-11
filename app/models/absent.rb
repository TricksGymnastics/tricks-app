class Absent < ActiveRecord::Base
  attr_accessible :day, :level_id, :location, :student_name, :time, :classtype_id
  belongs_to :classtype
  belongs_to :level  

  validates_presence_of :classtype_id, :location, :level_id, :day, :time, :student_name

  DAYS = [['Monday', 0], ['Tuesday', 1], ['Wednesday', 2], ['Thursday', 3], ['Friday', 4], ['Saturday', 5]]
  LOCATIONS = [['Granite Bay', 0], ['Folsom', 1], ['Sacramento', 2]]
  HUMAN_LOCATIONS = ['Granite Bay', 'Folsom', 'Sacramento']
  HUMAN_DAYS = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
end
