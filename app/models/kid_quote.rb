class KidQuote < ActiveRecord::Base
	def self.search(search)
  		if search
    		where('quote ILIKE ?', "%#{search}%")
 		else
   			scoped
 		end
	end
end
