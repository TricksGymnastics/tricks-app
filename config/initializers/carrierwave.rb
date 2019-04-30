require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.production? or Rails.env.development? #comment out the or if you are planning up testing upload
    config.fog_credentials = {
      :provider                         => 'Google',
      :google_storage_access_key_id     => ENV['GOOGLE_KEY_ID'],  
      :google_storage_secret_access_key => ENV['GOOGLE_ACCESS_KEY'],
      :persistent                       => false 
    }
    config.fog_directory = 'tricks-images'
    config.storage = :fog
  else
    config.storage = :file
    config.enable_processing = true
  end
end