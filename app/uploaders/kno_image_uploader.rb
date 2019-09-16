# encoding: utf-8

class KNOImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def fog_directory
    'datenight-images'
  end
  
  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
