# encoding: utf-8

class WorldImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  
  def fog_directory
    'where-in-the-world'
  end
  
  def store_dir
    "#{model.first_name+'_'+model.last_name}".tr(" ", "_")
  end
  
  version :thumb do
    process :resize_to_fit => [600, 600]
  end
  
  def extension_white_list
    %w(jpg jpeg gif png)
  end
end