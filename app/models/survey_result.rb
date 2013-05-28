class SurveyResult < ActiveRecord::Base
  # attr_accessible :title, :body

  has_many :questions
  belongs_to :survey
  accepts_nested_attributes_for :questions, allow_destroy: true

  #validates_presence_of :answer

  # def to_param
  #   name
  # end
end
