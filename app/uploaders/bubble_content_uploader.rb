# encoding: utf-8

class BubbleContentUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def fog_directory
    'bubble-content-images'
  end
  process :resize_to_fill => [500, 500, gravity = 'Center']
  
  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
