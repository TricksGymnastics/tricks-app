class EmploymentApplicationMailer < ApplicationMailer
  def gym_notification(application)
    @application = application
    subject = "Employment Application for: " + application.firstname + " " + application.lastname
    
    locations = []
    if application.granite_bay
      locations << "tricksgb@gmail.com"
    end
    
    if application.folsom
      locations << "tricksfol@gmail.com"
    end
    
    if application.sacramento
      locations << "trickssac@gmail.com"
    end
    
    mail to: "trickswebmaster@gmail.com", cc: locations, subject: subject #TODO: change to bcc: after i have verified it works
  end
end
