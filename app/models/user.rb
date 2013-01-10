class User < ActiveRecord::Base
	has_secure_password
	attr_accessible :email, :password, :password_confirmation, :role
	validates_uniqueness_of :email

	validates_presence_of :email, :password, :password_confirmation

	def self.search(search)
  		if search
    		where('user ILIKE ?', "%#{search}%")
 		else
   			scoped
 		end
	end
end