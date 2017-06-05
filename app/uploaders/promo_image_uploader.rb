# encoding: utf-8

class PromoImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  
  def fog_directory
    'promo-images'
  end
  
  process :resize_to_limit => [400, 225, gravity = 'Center']

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
