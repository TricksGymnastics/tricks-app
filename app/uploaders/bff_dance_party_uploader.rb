# encoding: utf-8

class BffDancePartyUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def fog_directory
    'bff-dance-party-images'
  end
  
  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
