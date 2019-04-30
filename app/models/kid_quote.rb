class KidQuote < ActiveRecord::Base

	validates_presence_of :quote

	def self.search(search)
  		if search
    		where('quote ILIKE ?', "%#{search}%")
 		else
   			KidQuote.all
 		end
	end
end
