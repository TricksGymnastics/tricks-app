class EmploymentApplicationMailer < ActionMailer::Base
  require 'mail'
  address = Mail::Address.new "tricksgym@gmail.com"
  address.display_name = "Tricks Gymnastics, Dance & Swim"
  address.format

  default from: address

  def gym_notification(application)
    @application = application
    subject = "Employment Application for: " + application.firstname + " " + application.lastname
    
    if (application.granite_bay)
      mail to: "tricksgb@gmail.com", subject: subject
    end
    
    if (application.folsom)
      mail to: "tricksfol@gmail.com", subject: subject
    end
    
    if (application.sacramento)
      mail to: "trickssac@gmail.com", subject: subject
    end

    # mail to: "football80@gmail.com", subject: "This better work " + @absent.student_name
  end
end
