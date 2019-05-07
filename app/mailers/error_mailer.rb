class ErrorMailer < ApplicationMailer
  def error_details(url, error)
    @url = url
    @error = error
    mail to: "trickswebmaster@gmail.com", subject: "Website Error: " + error.message
  end

end
