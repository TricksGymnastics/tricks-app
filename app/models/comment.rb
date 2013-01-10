class Comment < ActiveRecord::Base

	validates_presence_of :comment, :name

	def self.search(search)
  		if search
    		where('comment ILIKE ?', "%#{search}%")
 		else
   			scoped
 		end
	end
end
