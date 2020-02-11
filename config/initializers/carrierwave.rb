require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.production? or Rails.env.development? #comment out the or if you are planning up testing upload
    config.fog_credentials = {
      :provider                         => 'Google',
      :google_storage_access_key_id     => Rails.application.credentials.google_storage[:access_key_id],
      :google_storage_secret_access_key => Rails.application.credentials.google_storage[:secret_access_key],
      :persistent                       => false 
    }
    config.fog_directory = 'tricks-images'
    config.fog_attributes = { cache_control: "no-cache" }
    config.storage = :fog
  else
    config.storage = :file
    config.enable_processing = true
  end
end