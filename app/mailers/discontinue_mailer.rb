class DiscontinueMailer < ApplicationMailer
  def gym_notification(notification)
    @notification = notification
    @subject = "Notice of Discontinuation for: " + @notification.student_first_name + " " + @notification.student_last_name
    
    to_address = get_location_email(DiscontinueNotice::LOCATIONS[@notification.location][0])
    
    mail to: to_address, subject: @subject
  end
end