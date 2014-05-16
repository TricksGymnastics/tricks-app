class RecitalAdMailer < ActionMailer::Base
  default from: "tricksgym@gmail.com"

  def order_confirmation(order)
    @order = order
    mail to: @order.email, subject: "Recital Ad Order Confirmation"

  end
end
