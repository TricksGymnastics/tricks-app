class KidsNightOut < ActiveRecord::Base
    mount_uploader :image, DatenightImageUploader
end
