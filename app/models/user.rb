class User < ActiveRecord::Base
	has_secure_password
	attr_accessible :email, :password, :password_confirmation
	validates_uniqueness_of :email

	def self.search(search)
  		if search
    		where('user ILIKE ?', "%#{search}%")
 		else
   			scoped
 		end
	end
end