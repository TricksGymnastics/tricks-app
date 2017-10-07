class AbsentMailer < ActionMailer::Base
  require 'mail'
  address = Mail::Address.new "webmaster@tricksgym.com"
  address.display_name = "Tricks Gymnastics, Dance & Swim"
  address.format

  default from: address

  def gym_notification(absent)
    @absent = absent
    
    if (Absent::HUMAN_LOCATIONS[absent.location.to_i] == "Granite Bay")
      mail to: "tricksgb@gmail.com", subject: "Absence for: " + @absent.first_name + " " + @absent.last_name
    elsif (Absent::HUMAN_LOCATIONS[absent.location.to_i] == "Folsom")
      mail to: "tricksfol@gmail.com", subject: "Absence for: " + @absent.first_name + " " + @absent.last_name
    elsif (Absent::HUMAN_LOCATIONS[absent.location.to_i] == "Sacramento")
      mail to: "trickssac@gmail.com", subject: "Absence for: " + @absent.first_name + " " + @absent.last_name
    end

    # mail to: "football80@gmail.com", subject: "This better work " + @absent.student_name
  end
end
