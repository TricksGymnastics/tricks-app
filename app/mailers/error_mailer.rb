class ErrorMailer < ActionMailer::Base
  require 'mail'
  address = Mail::Address.new "trickswebmaster@gmail.com"
  address.display_name = "Tricks Webmaster"
  address.format

  default from: address

  def error_details(url, error)
    @url = url
    @error = error
    mail to: "trickswebmaster@gmail.com", subject: "Website Error: " + error.message
  end

end
