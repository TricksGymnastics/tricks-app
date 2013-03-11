class Schedule < ActiveRecord::Base
	belongs_to :classtype
	belongs_to :level
	belongs_to :coach
	

	validates_presence_of :classtype_id, :location, :level_id, :day, :time, :teacher


	DAYS = [['Monday', 0], ['Tuesday', 1], ['Wednesday', 2], ['Thursday', 3], ['Friday', 4], ['Saturday', 5]]
	TIMES = ['9:00 AM', '9:30 AM', '10:00 AM', '11:00 AM', '12:00 PM', '12:30 PM', '3:30 PM', '3:45 PM', '4:00 PM', '5:05 PM', '5:15 PM', '5:30 PM', '6:30 PM', '6:35 PM']
	LOCATIONS = ['Granite Bay', 'Folsom', 'Sacramento']
	HUMAN_DAYS = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']

	def self.location_search(location_search)
  		if location_search
    		where('location ILIKE ?', "%#{location_search}%")
 		else
 			scoped
 		end
	end

	def self.level_search(level_search)
  		if level_search
    		where('levelname ILIKE ?', "%#{level_search}%")
 		else
 			scoped
 		end
	end

	def self.day_search(day_search)
  		if day_search
    		where('day ILIKE ?', "%#{day_search}%")
 		else
 			scoped
 		end
	end

	def self.time_search(time_search)
  		if time_search
    		where('time ILIKE ?', "%#{time_search}%")
 		else
 			scoped
 		end
	end

	def self.teacher_search(teacher_search)
  		if teacher_search
    		where('teacher ILIKE ?', "%#{teacher_search}%")
 		else
 			scoped
 		end
	end

	def self.age_search(age_search)
  		if age_search
  			@age.to_s
  			where('age ILIKE ?', "%#{age_search}%")
 		else
 			scoped
 		end
	end

	def self.gender_search(gender_search)
  		if gender_search
    		where('gender ILIKE ?', "%#{gender_search}%")
 		else
 			scoped
 		end
	end



end
