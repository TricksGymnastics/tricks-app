class KidsNightOut < ActiveRecord::Base
    mount_uploader :image, KNOImageUploader
end
