class Comment < ApplicationRecord

	validates_presence_of :comment, :name

  #validates :comment, exclusion: { in: %w(www http href href="), message: "%{value} is reserved." }
  #validates_format_of :comment, :without => /\A(<a href=|http)\Z/
  validates_format_of :comment, :without => /(www|http|href)/, message: "cannot contain a url."

	def self.search(search)
  		if search
    		where('comment ILIKE ?', "%#{search}%")
 		else
 		    Comment.all
 		end
	end
end
