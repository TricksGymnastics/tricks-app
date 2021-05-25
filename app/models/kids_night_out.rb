class KidsNightOut < ActiveRecord::Base
    mount_uploader :image, KNOImageUploader
	has_one_attached :image_new
end
