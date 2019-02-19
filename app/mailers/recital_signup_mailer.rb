class RecitalSignupMailer < ApplicationMailer
  def gym_notification(signup)
    @signup = signup
    
    @subject = "Recital Signup for: " + @signup.child_first_name + " " + @signup.child_last_name
    to_address = get_location_email(Absent::LOCATIONS[@signup.location][0])
    
    mail to: to_address, subject: @subject
  end
end
