CarrierWave.configure do |config|
  # config.fog_credentials = {
  #   :provider                         => 'Google',
  #   :google_storage_access_key_id     => ENV['GOOGLE_KEY_ID'],  
  #   :google_storage_secret_access_key => ENV['GOOGLE_ACCESS_KEY']
  # }

  #For Dev Purposes
  config.fog_credentials = {
    :provider                         => 'Google',
    :google_storage_access_key_id     => 'GOOGHPIH4JRNVFHDHAXO',
    :google_storage_secret_access_key => '+m9YwS0YlqmQVMAvtsSFnvGxdouZllAA6F6VvWff'
  }

  #config.fog_directory = @fog_directory
end