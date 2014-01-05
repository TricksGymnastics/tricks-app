class Comment < ActiveRecord::Base

	validates_presence_of :comment, :name

  #validates :comment, exclusion: { in: %w(www http href href="), message: "%{value} is reserved." }
  #validates_format_of :comment, :without => /\A(<a href=|http)\Z/
  validates_format_of :comment, :with => /\A(?!www|!http|!<a href=)\Z/, message: "cannot contain a url."

	def self.search(search)
  		if search
    		where('comment ILIKE ?', "%#{search}%")
 		else
   			scoped
 		end
	end
end
