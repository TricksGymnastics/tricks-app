class PromoSlide < ActiveRecord::Base
  attr_accessible :data_type, :html_code, :image, :link, :live, :order, :title, :link_path
  validates_presence_of :title

  mount_uploader :image, PromoImageUploader

  default_scope :order => 'promo_slides.order'

end
