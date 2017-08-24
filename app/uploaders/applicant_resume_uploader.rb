# encoding: utf-8

class ApplicantResumeUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  # storage :fog
  
  def fog_directory
    'applicant-resumes'
  end
  
  def filename
    "#{model.firstname+'_'+model.lastname+"_resmue_"}#{SecureRandom.hex(4)}.#{file.extension}".tr(" ", "_")
  end
  
  def extension_white_list
    %w(pdf)
  end
end
