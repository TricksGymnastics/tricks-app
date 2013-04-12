class KidQuote < ActiveRecord::Base

	validates_presence_of :quote

	def self.search(search)
  		if search
    		where('quote ILIKE ?', "%#{search}%")
 		else
   			scoped
 		end
	end
end
