class AbsentMailer < ActionMailer::Base
  default from: "tricksgym@gmail.com"

  def gym_notification(absent)
    @absent = absent

    if (Absent::HUMAN_LOCATIONS[absent.location.to_i] == "Granite Bay")
      mail to: "tricksgb@gmail.com", subject: "Absence for: " + @absent.student_name + " " + @absent.last_name
    elsif (Absent::HUMAN_LOCATIONS[absent.location.to_i] == "Folsom")
      mail to: "tricksfol@gmail.com", subject: "Absence for: " + @absent.student_name + " " + @absent.last_name
    elsif (Absent::HUMAN_LOCATIONS[absent.location.to_i] == "Sacramento")
      mail to: "trickssac@gmail.com", subject: "Absence for: " + @absent.student_name + " " + @absent.last_name
    end

    # mail to: "football80@gmail.com", subject: "This better work " + @absent.student_name
  end
end
