class AbsentMailer < ApplicationMailer
  def gym_notification(absent)
    @absent = absent
    
    to_address = get_location_email(Absent::HUMAN_LOCATIONS[absent.location.to_i])
    subject = "Absence for: " + @absent.first_name + " " + @absent.last_name
    
    mail to: to_address, subject: subject
  end
end