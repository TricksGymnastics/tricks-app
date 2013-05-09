class SurveysTaken < ActiveRecord::Base
  # attr_accessible :title, :body

  has_many :questions
  accepts_nested_attributes_for :questions, allow_destroy: true

  # def to_param
  #   name
  # end
end
