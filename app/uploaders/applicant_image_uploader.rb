# encoding: utf-8

class ApplicantImageUploader < CarrierWave::Uploader::Base
include CarrierWave::MiniMagick

  # storage :fog

  def fog_directory
    'applicant-images'
  end
  
  def store_dir
    "#{model.firstname+'_'+model.lastname}".gsub(" ", "_")
  end

  def default_url
    "/assets/neutral_default.png"
  end

  version :thumb do
    process :resize_to_fill => [400, nil]
  end

  def extension_white_list
    %w(jpg jpeg png)
  end

  # def filename
  #   "#{model.firstname+'_'+model.lastname}.#{file.extension}".tr(" ", "_") if original_filename
  # end
end