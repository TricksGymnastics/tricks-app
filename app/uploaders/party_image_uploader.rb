# encoding: utf-8
# http://www.rubydoc.info/github/jnicklas/carrierwave/CarrierWave/MiniMagick
class PartyImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def fog_directory
    'party-images'
  end
  
  process resize_to_fit: [800, 800]
  
  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
