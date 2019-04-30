class Datenight < ActiveRecord::Base
  #attr_accessible :about, :image, :single_price, :sibling_price, :schedule_title, :when_time, :datenight_events_attributes
  mount_uploader :image, DatenightImageUploader
  has_many :datenight_events
  accepts_nested_attributes_for :datenight_events, allow_destroy: true
end
