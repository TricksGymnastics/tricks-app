class Ability
	include CanCan::Ability

	def initialize(user) 
		user ||= User.new
    	if user.role == "author"
			can :manage, :all
			cannot :showtable, :all
			cannot :update, :all
			cannot :destroy, :all
	 	end
	 	if user.role == "admin" 
	 		can :manage, :all
       	end
       	if user.role == "moderator"
         	can :manage, :all
         	cannot :destroy, :all
        end 
  	end 
end