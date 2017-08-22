class ApplicantResumeUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  
  def fog_directory
    'applicant-resumes'
  end
  
  def filename
    "#{model.id.to_s+"_"+model.firstname+'_'+model.lastname}.#{file.extension}".gsub(" ", "_")
  end
  
  def extension_white_list
    %w(pdf doc docx pub)
  end
end
