class Camp < ApplicationRecord
  mount_uploader :image, CampImageUploader
end
