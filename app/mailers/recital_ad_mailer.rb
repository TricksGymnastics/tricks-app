class RecitalAdMailer < ApplicationMailer
  def order_confirmation(recital_ad)
    @recital_ad = recital_ad
    mail to: @recital_ad.email, subject: "Recital Ad Order Confirmation"
  end
end
