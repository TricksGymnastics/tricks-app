CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider                         => 'Google',
    :google_storage_access_key_id     => 'GOOGWKH5VTB6P4UGHIIT',
    :google_storage_secret_access_key => 'CAeaI1kEVIhqPWk+IGJDoGPPQt6FAEiijKn8yWte'
  }
  config.fog_directory = 'coach-pics'
end