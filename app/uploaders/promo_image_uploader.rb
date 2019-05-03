# encoding: utf-8

class PromoImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def fog_directory
    'promo-images'
  end
  
  process :resize_to_fill => [570, 320, gravity = 'Center']

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
