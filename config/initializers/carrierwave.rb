if Rails.env.development? or Rails.env.test?
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
  end
else
  CarrierWave.configure do |config|
    config.storage = :fog
    # config.fog_provider = 'fog-google'
    config.fog_credentials = {
      :provider                         => 'Google',
      :google_storage_access_key_id     => ENV['GOOGLE_KEY_ID'],  
      :google_storage_secret_access_key => ENV['GOOGLE_ACCESS_KEY']
    }
    config.fog_directory = 'tricks-images'
  end
end
