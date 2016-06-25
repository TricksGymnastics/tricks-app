# encoding: utf-8

class RecitalAdImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  
  def fog_directory
    'recital-ads'
  end
  
  def store_dir
    "uploaded_photos/#{model.firstname+'_'+model.lastname+'('+model.email+')'}".tr(" ", "_")
  end
  
  version :thumb do
    process :resize_to_fit => [300, 300]
  end
  
  def extension_white_list
    %w(jpg jpeg gif png)
  end
end