class ErrorMailer < ApplicationMailer
  def error_details(url, error, trace)
    @url = url
    @error = error
    @trace = trace
    @message = error.nil? ? "No Error" : error.message
    mail to: "trickswebmaster@gmail.com", subject: "Website Error: " + @message
  end

end
