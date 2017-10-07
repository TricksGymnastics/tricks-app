class RecitalAdMailer < ActionMailer::Base
  require 'mail'
  address = Mail::Address.new "trickswebmaster@gmail.com"
  address.display_name = "Tricks Gymnastics, Dance & Swim"
  address.format

  default from: address

  def order_confirmation(recital_ad)
    @recital_ad = recital_ad
    mail to: @recital_ad.email, subject: "Recital Ad Order Confirmation"

  end
end
