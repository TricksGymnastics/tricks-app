CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider                         => 'Google',
    # :google_storage_access_key_id     => ENV['GOOGLE_KEY_ID'],  
    :google_storage_access_key_id     => 'GOOGUUMMXPWPRU4CV6AK',  
    # :google_storage_secret_access_key => ENV['GOOGLE_ACCESS_KEY']
    :google_storage_secret_access_key => 'Iv5B7eLhkDGIBYn/Jr/4yt+hRNDb1cUSJri6WDKq'
  }


  #config.fog_directory = @fog_directory
end