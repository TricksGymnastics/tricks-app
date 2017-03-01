class RecitalSignupMailer < ActionMailer::Base
  require 'mail'
  address = Mail::Address.new "tricksgym@gmail.com"
  address.display_name = "Tricks Gymnastics, Dance & Swim"
  address.format

  default from: address

  def gym_notification(signup)
    @signup = signup
    @subject = "Recital Signup for: " + @signup.child_first_name + " " + @signup.child_last_name
    gym_email = "football80@gmail.com"
    if (Absent::LOCATIONS[@signup.location][0] == "Granite Bay")
      gym_email = "tricksgb@gmail.com"
    elsif (Absent::LOCATIONS[@signup.location][0] == "Folsom")
      gym_email = "tricksfol@gmail.com"
    elsif (Absent::LOCATIONS[@signup.location][0] == "Sacramento")
      gym_email = "trickssac@gmail.com"
    else
      @subject = "Something went wrong in recital_signup_mailer and a gym didn't receive this submission"
    end
    
    mail to: gym_email, subject: @subject
  end
end
