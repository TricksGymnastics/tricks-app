class RecitalAdType < ApplicationRecord
  #attr_accessible :name, :price, :word_max, :actual_size, :image, :pdf_file
  has_many :recital_ads

  default_scope {order('recital_ad_types.name')}
end
