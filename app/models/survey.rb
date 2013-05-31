class Survey < ActiveRecord::Base
  attr_accessible :name, :questions_attributes, :live, :scoreable, :image, :image_result, :remove_image
  has_many :questions
  has_many :survey_results, dependent: :destroy
  accepts_nested_attributes_for :questions, allow_destroy: true
  validates_presence_of :name

  mount_uploader :image, SurveyImageUploader

  # def to_param
  #   name
  # end
end
