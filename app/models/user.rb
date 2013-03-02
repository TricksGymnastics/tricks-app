class User < ActiveRecord::Base
	has_secure_password
	attr_accessible :email, :password, :password_confirmation, :role

	validates_presence_of :email, :password
	validates_uniqueness_of :email

	def self.search(search)
  		if search
    		where('email ILIKE ?', "%#{search}%")
 		else
   			scoped
 		end
	end
end