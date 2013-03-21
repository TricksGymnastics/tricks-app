class RecitalAd < ActiveRecord::Base
  attr_accessible :title, :body, :recital_ad_type_id, :properties, :firstname, :lastname, :email
  belongs_to :recital_ad_type
  serialize :properties, Hash
end
