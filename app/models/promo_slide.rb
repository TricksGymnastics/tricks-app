class PromoSlide < ApplicationRecord
  #attr_accessible :data_type, :html_code, :image, :link, :live, :sort_order, :title, :link_path, :remove_image
  validates_presence_of :title

  mount_uploader :image, PromoImageUploader


end
