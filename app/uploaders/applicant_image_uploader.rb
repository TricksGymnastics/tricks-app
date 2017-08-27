# encoding: utf-8

class ApplicantImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def fog_directory
    'employment-applications'
  end 
  
  def store_dir
    "#{model.id.to_s+"_"+model.firstname+'_'+model.lastname}".tr(" ", "_")
  end
  
  def filename
    "#{model.id.to_s+"_"+model.firstname+'_'+model.lastname+"_image"}.#{file.extension}".tr(" ", "_")
  end
  
  def default_url
    "/assets/neutral_default.png"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
  
  def auto_orient
    manipulate! do |img|
      img = img.auto_orient
    end
  end
  process :auto_orient
  process :resize_to_fill => [400, -1]
end