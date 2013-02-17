class Ability
	include CanCan::Ability

	def initialize(user) 
		user ||= User.new
			
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
		#Coach

		if user.role == "superadmin" #Jordan
		   	can :manage, :all
		end

		if user.role == "admin" #Barbara Jo, Vern, Managers, Office Staff
	 		can :manage, Comment
	 		can :manage, KidQuote
	 		can :manage, Schedule
	 		can :manage, Level
	 		can :manage, Coach
       	end

       	if user.role == "moderator" #Coaches
       		can :manage, Comment
	 		can :manage, KidQuote
	 		can :read, Schedule
         	cannot :destroy, :all
         	cannot :edit, :all
        end 

    	if user.role == "author" #Not logged in
			can :read, Comment
			can :create, Comment
			cannot :show, Comment
			can :read, Schedule
			can :read, Coach
		end
	 	

	end 
end