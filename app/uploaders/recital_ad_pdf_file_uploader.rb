# encoding: utf-8

class RecitalAdPdfFileUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def fog_directory
    'recital-ads'
  end
  
  def store_dir
    "uploaded_files/#{model.firstname+'_'+model.lastname+'('+model.email+')'}".tr(" ", "_")
  end
  
  def extension_white_list
    %w(pdf)
  end
end