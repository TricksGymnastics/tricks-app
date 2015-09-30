class DiscontinueMailer < ActionMailer::Base
  require 'mail'
  address = Mail::Address.new "tricksgym@gmail.com"
  address.display_name = "Tricks Gymnastics, Dance & Swim"
  address.format

  default from: address

  def gym_notification(notification)
    @notification = notification

    if (DiscontinueNotice::LOCATIONS[@notification.location][0] == "Granite Bay")
      mail to: "tricksgb@gmail.com", subject: "Notice of Discontinuation for: " + @notification.student_first_name + " " + @notification.student_last_name
    elsif (DiscontinueNotice::LOCATIONS[@notification.location][0] == "Folsom")
      mail to: "tricksfol@gmail.com", subject: "Notice of Discontinuation for: " + @notification.student_first_name + " " + @notification.student_last_name
    elsif (DiscontinueNotice::LOCATIONS[@notification.location][0] == "Sacramento")
      mail to: "trickssac@gmail.com", subject: "Notice of Discontinuation for: " + @notification.student_first_name + " " + @notification.student_last_name
    end

    # mail to: "football80@gmail.com", subject: "This better work " + @notification.student_first_name
  end
end


http://www.tricksgym.com/discontinue_notices