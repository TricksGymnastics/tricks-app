# encoding: utf-8

class WebsitePdfUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def fog_directory
    'website-pdfs'
  end
end