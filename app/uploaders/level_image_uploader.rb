# encoding: utf-8

class LevelImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  
  def fog_directory
    'level-images'
  end
  
  def store_dir
    "#{model.levelname}".tr(" ", "_")
  end
  
  version :thumb do
    process :resize_to_fit => [600, 600]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
