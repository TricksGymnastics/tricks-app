class EmploymentApplicationMailer < ApplicationMailer
  def gym_notification(review)
    @review = review
    subject = "Employment Application for: " + @review.employment_application.firstname + " " + @review.employment_application.lastname
    
    email = ""
    if review.location == "granite_bay"
      email = "tricksgb@gmail.com"
    elsif review.location == "folsom"
      email = "tricksfol@gmail.com"
    elsif review.location == "sacramento"
      email = "trickssac@gmail.com"
    end
    
    mail to: "trickswebmaster@gmail.com", cc: email, subject: subject #TODO: change to bcc: after i have verified it works
  end
  
  def application_confirmation(application)
    @application = application
    subject = "Application for Tricks Gymnastics received"
    
    mail to: application.email, cc: "trickswebmaster@gmail.com", subject: subject
  end
end
