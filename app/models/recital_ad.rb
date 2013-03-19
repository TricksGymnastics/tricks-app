class RecitalAd < ActiveRecord::Base
  attr_accessible :title, :body, :recital_ad_type_id, :properties
  belongs_to :recital_ad_type
  serialize :properties, Hash
end
