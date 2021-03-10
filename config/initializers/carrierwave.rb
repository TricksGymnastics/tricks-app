require 'carrierwave/storage/fog'
# https://stackoverflow.com/questions/52528623/migrating-carrierwave-to-activestorage

# This stuff stays so that old existing images still work
CarrierWave.configure do |config|
  if Rails.env.production? or Rails.env.development? #comment out the or if you are planning up testing upload
    config.fog_credentials = {
      :provider                         => 'Google',
      :google_storage_access_key_id     => Rails.application.credentials.google_storage[:access_key_id],
      :google_storage_secret_access_key => Rails.application.credentials.google_storage[:secret_access_key],
      # :persistent                       => false 
    }
    
#     config.fog_provider = 'fog/google'
#     config.fog_credentials = {
#       provider: 'Google',
#       google_project: Rails.application.credentials.google_storage[:project_name],
#       google_json_key_string: Rails.application.credentials.google_storage[:credential_content]
#     }
    config.storage = :fog

    # config.fog_directory = Rails.application.credentials.google_storage[:default_bucket_name]
    # config.fog_attributes = { cache_control: "no-cache" }
  else
    config.storage = :file
    config.enable_processing = true
  end
end

# CarrierWave.configure do |config|
#   config.storage                             = :gcloud
#   config.gcloud_bucket                       = Rails.application.credentials.google_storage[:default_bucket_name]
#   config.gcloud_bucket_is_public             = true
#   config.gcloud_authenticated_url_expiration = 600
#   # config.gcloud_content_disposition          = 'attachment' // or you can skip this
  
#   config.gcloud_attributes = {
#     expires: 600
#   }
  
#   config.gcloud_credentials = {
#     gcloud_project: Rails.application.credentials.google_storage[:project_name],
#     gcloud_keyfile: Rails.application.credentials.google_storage[:credential_content]
#   }
# end