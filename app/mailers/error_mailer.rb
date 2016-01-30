class ErrorMailer < ActionMailer::Base
  require 'mail'
  address = Mail::Address.new "trickswebmaster@gmail.com"
  address.display_name = "Tricks Webmaster"
  address.format

  default from: address

  def error_details(error)
    @error = error
    mail to: "trickswebmaster@gmail.com", subject: "Website Error"
  end

end
