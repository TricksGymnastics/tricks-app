class DiscontinueMailer < ActionMailer::Base
  require 'mail'
  address = Mail::Address.new "webmaster@tricksgym.com"
  address.display_name = "Tricks Gymnastics, Dance & Swim"
  address.format

  default from: address

  def gym_notification(notification)
    @notification = notification
    @subject = "Notice of Discontinuation for: " + @notification.student_first_name + " " + @notification.student_last_name
    gym_email = "football80@gmail.com"
    if (DiscontinueNotice::LOCATIONS[@notification.location][0] == "Granite Bay")
      gym_email = "tricksgb@gmail.com"
    elsif (DiscontinueNotice::LOCATIONS[@notification.location][0] == "Folsom")
      gym_email = "tricksfol@gmail.com"
    elsif (DiscontinueNotice::LOCATIONS[@notification.location][0] == "Sacramento")
      gym_email = "trickssac@gmail.com"
    else
      @subject = "Something went wrong in discontinue_mailer and a gym didn't receive this submission"
    end
    
    mail to: gym_email, subject: @subject
  end
end