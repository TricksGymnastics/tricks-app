class Camp < ActiveRecord::Base
  mount_uploader :image, CampImageUploader
end
