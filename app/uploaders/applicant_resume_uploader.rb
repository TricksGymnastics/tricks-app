# encoding: utf-8

class ApplicantResumeUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  # storage :fog
  
  def fog_directory
    'employment-applications'
  end
  
  def store_dir
    "#{model.firstname+'_'+model.lastname+'_'+secure_token}".tr(" ", "_")
  end
  
  def filename
    "resume."+"#{file.extension}".tr(" ", "_") if original_filename.present?
  end
  
  def extension_white_list
    %w(pdf)
  end
  
  protected
  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
  end
end
