class RecitalAd < ActiveRecord::Base
  #attr_accessible :title, :body, :recital_ad_type_id, :firstname, :lastname, :email, :stripe_card_token, :image, :pdf_file, :message
  belongs_to :recital_ad_type
  validates_presence_of :email

  validates :firstname,:presence => {:message => "cannot be blank."}#, :allow_blank => true,:format => /^[A-Za-z\d_-]+$/
  validates :lastname,:presence => {:message => "cannot be blank."}#, :allow_blank => true,:format => /^[A-Za-z\d_-]+$/

  mount_uploader :image, RecitalAdImageUploader
  mount_uploader :pdf_file, RecitalAdPdfFileUploader

  attr_accessor :stripe_card_token
end
