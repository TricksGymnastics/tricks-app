# encoding: utf-8

class CampImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def fog_directory
    'camps-images'
  end
  
  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
