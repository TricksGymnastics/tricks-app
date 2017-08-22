CarrierWave.configure do |config|
  if Rails.env.production?
    config.fog_credentials = {
      :provider                         => 'Google',
      :google_storage_access_key_id     => ENV['GOOGLE_KEY_ID'],  
      :google_storage_secret_access_key => ENV['GOOGLE_ACCESS_KEY']
    }
    config.fog_directory = 'tricks-images'
    config.storage = :fog
  else
    config.storage = :file
    config.enable_processing = false
  end
end