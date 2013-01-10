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

		## Object ##
		#Comment
		#KidQuote
		#User
		#Schedule
		#Level

		if user.role == "superadmin" #Jordan
		   	can :manage, :all
		end

		if user.role == "admin" #Barbara Jo, Vern, Managers
	 		can :manage, Comment
	 		can :manage, KidQuote
	 		can :manage, Schedule
	 		can :manage, Level
       	end

       	if user.role == "moderator" #Office Staff
       		can :manage, Comment
	 		can :manage, KidQuote
	 		can :manage, Schedule
	 		can :manage, Level
         	cannot :destroy, :all
        end 

    	if user.role == "author" #Coaches
			can :manage, Comment
	 		can :manage, KidQuote
         	cannot :destroy, :all
         	cannot :edit, :all
		end
	 	

	end 
end