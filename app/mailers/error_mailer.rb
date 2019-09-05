class ErrorMailer < ApplicationMailer
  def error_details(url, error)
    @url = url
    @error = error
    @message = error.nil? ? "No Error" : error.message
    mail to: "trickswebmaster@gmail.com", subject: "Website Error: " + @message
  end

end
