class PromoSlide < ActiveRecord::Base
  validates_presence_of :title

  mount_uploader :image, PromoImageUploader

	has_one_attached :image_new
end
