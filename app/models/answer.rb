class Answer < ActiveRecord::Base
  #attr_accessible :content, :question_id, :weight
  belongs_to :question

  validates_presence_of :content
end
