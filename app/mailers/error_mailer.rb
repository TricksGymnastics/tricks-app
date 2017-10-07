class ErrorMailer < ActionMailer::Base
  require 'mail'
  address = Mail::Address.new "webmaster@tricksgym.com"
  address.display_name = "Tricks Webmaster"
  address.format

  default from: address

  def error_details(error)
    @error = error
    mail to: "trickswebmaster@gmail.com", subject: "Website Error: " + error.message
  end

end
