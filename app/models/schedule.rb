class Schedule < ActiveRecord::Base
	belongs_to :classtype
	belongs_to :level
	belongs_to :coach
	

	validates_presence_of :classtype_id, :level_id, :day, :time, :teacher, :gender, :location

	def self.location_search(location_search)
  		if location_search
    		where('location ILIKE ?', "%#{location_search}%")
 		else
 			scoped
 		end
	end

	def self.level_search(level_search)
  		if level_search

    		where('name ILIKE ?', "%#{level_search}%")
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
