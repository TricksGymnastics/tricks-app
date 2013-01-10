class Ability
	include CanCan::Ability

	def initialize(user) 
		user ||= User.new
			can :read, Comment
			can :create, Comment
			cannot :show, Comment
			can :read, Schedule
		## List of Actions ##
		# :read
		# :create
		# :show
		# :update
		# :destroy		
		# :manage

		if user.role == "superadmin"
		   	can :manage, :all
		end

		if user.role == "admin" 
	 		can :manage, Comment
	 		can :manage, KidQuote
	 		can :manage, Schedule
	 		can :manage, Level
       	end

       	if user.role == "moderator"
       		can :manage, Comment
	 		can :manage, KidQuote
	 		can :manage, Schedule
         	cannot :destroy, :all
        end 

    	if user.role == "author"
			can :create, Comment
			can :read, Comment
			cannot :show, Comment
		end
	 	

	end 
end