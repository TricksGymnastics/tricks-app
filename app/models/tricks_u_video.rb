class TricksUVideo < ActiveRecord::Base
  belongs_to :tricks_u_category
  #attr_accessible :title, :url, :weight, :category_id
  validates_presence_of :title, :url

end
