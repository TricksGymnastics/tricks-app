# encoding: utf-8

class ApplicantImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  # storage :fog

  def fog_directory
    'applicant-images'
  end
  
  def store_dir
    "#{model.firstname+'_'+model.lastname+"_"+Time.now.to_i}".tr(" ", "_")
  end
  
  def filename
    "image."+"#{file.extension}".tr(" ", "_") if original_filename.present?
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