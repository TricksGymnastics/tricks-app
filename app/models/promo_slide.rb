class PromoSlide < ActiveRecord::Base
  attr_accessible :data_type, :html_code, :image, :link, :live, :order, :title
  validates_presence_of :title
end
