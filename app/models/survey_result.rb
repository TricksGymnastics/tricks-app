class SurveyResult < ActiveRecord::Base
  attr_accessible :feedback

  has_many :questions
  belongs_to :survey
  accepts_nested_attributes_for :questions, allow_destroy: true

  default_scope :order => 'survey_results.created_at'

  #validates_presence_of :answer

  # def to_param
  #   name
  # end
end
