class RecitalAdMailer < ActionMailer::Base
require 'mail'
email = "tricksgym@gmail.com"
address = Mail::Address.new email # ex: "john@example.com"
name = "Tricks Gymnastics, Dance & Swim"
address.display_name = name # ex: "John Doe"
# Set the From or Reply-To header to the following:
address.format # returns "John Doe <john@example.com>"

  default from: address

  def order_confirmation(recital_ad)
    @recital_ad = recital_ad
    mail to: @recital_ad.email, subject: "Recital Ad Order Confirmation"

  end
end
