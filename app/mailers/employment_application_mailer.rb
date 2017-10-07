class EmploymentApplicationMailer < ActionMailer::Base
  require 'mail'
  address = Mail::Address.new "webmaster@tricksgym.com"
  address.display_name = "Tricks Gymnastics, Dance & Swim"
  address.format

  default from: address

  def gym_notification(application)
    @application = application
    locations = []
    subject = "Employment Application for: " + application.firstname + " " + application.lastname
    
    if application.granite_bay
      locations << "tricksgb@gmail.com"
    end
    
    if application.folsom
      locations << "tricksfol@gmail.com"
    end
    
    if application.sacramento
      locations << "trickssac@gmail.com"
    end
    
    mail cc: locations, subject: subject #change to bcc: after i have verified it works
  end
end
