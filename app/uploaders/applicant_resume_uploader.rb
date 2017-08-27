# encoding: utf-8

class ApplicantResumeUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  
  def fog_directory
    'employment-applications'
  end
  
  def store_dir
    "#{model.id.to_s+"_"+model.firstname+'_'+model.lastname}".tr(" ", "_")
  end
  
  def filename
    "#{model.id.to_s+"_"+model.firstname+'_'+model.lastname+"_resume"}.#{file.extension}".tr(" ", "_")
  end
  
  def extension_white_list
    %w(pdf)
  end
end
