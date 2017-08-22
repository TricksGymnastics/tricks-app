# encoding: utf-8

class ApplicantResumeUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  # storage :fog
  
  def fog_directory
    'applicant-resumes'
  end
  
  def filename
    "#{model.id.to_s+"_"+model.firstname+'_'+model.lastname+"_resmue"}.#{file.extension}".gsub(" ", "_")
  end
  
  def extension_white_list
    %w(pdf doc docx pub)
  end
end
