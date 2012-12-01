class Comment < ActiveRecord::Base
	def self.search(search)
  		if search
    		where('comment ILIKE ?', "%#{search}%")
 		else
   			scoped
 		end
	end
end
