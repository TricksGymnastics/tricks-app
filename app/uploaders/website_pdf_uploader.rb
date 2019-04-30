# encoding: utf-8

class WebsitePdfUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def fog_directory
    'website-pdfs'
  end
  
  def filename
    "#{model.file_name}.#{file.extension}".tr(" ", "_")
  end
  
  def extension_white_list
    %w(pdf)
  end
end