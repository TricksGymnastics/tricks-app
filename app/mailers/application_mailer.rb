class ApplicationMailer < ActionMailer::Base
  default from: "Tricks Gymnastics, Dance & Swim <no_reply@tricksgym.com>"
  
  def get_location_email(location)
    to_location = "football80@gmail.com"
    if (location == "Granite Bay")
      to_address = "tricksgb@gmail.com"
    elsif (location == "Folsom")
      to_address = "tricksfol@gmail.com"
    elsif (location == "Sacramento")
      to_address = "trickssac@gmail.com"
    end
    to_location
  end
end
