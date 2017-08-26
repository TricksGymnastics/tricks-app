# encoding: utf-8

class ApplicantImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  # storage :fog

  def fog_directory
    'applicant-images'
  end
  
  def store_dir
    "#{model.firstname+'_'+model.lastname+'_'+secure_token}".tr(" ", "_") #not unique and it should be, but whatever for now
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
  
  
  protected
  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
  end
end