class Camp < ActiveRecord::Base
  mount_uploader :image, CampUploader
end
