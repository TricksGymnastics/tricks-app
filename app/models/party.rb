class Party < ActiveRecord::Base
  mount_uploader :image, PartyImageUploader
  mount_uploader :image2, PartyImageUploader
  mount_uploader :image3, PartyImageUploader
end
