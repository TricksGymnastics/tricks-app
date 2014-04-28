class Absent < ActiveRecord::Base
  attr_accessible :level_id, :location, :student_name, :time, :classtype_id, :last_name, :date
  belongs_to :classtype
  belongs_to :level
  # has_one :schedule

  validates_presence_of :classtype_id, :location, :level_id, :time, :student_name, :last_name, :date

  LOCATIONS = [['Granite Bay', 0], ['Folsom', 1], ['Sacramento', 2]]
  HUMAN_LOCATIONS = ['Granite Bay', 'Folsom', 'Sacramento']

end
