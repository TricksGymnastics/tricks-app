class BubbleContent < ActiveRecord::Base
    
    
  mount_uploader :image, BubbleContentUploader
end
