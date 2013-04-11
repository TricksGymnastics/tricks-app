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
		#RecitalAd

		if user.role == "superadmin" #Jordan
			can :manage, :all
		end

		if user.role == "admin" #, Barbara Jo, Vern
			can :manage, Comment
			can :manage, KidQuote
			can :manage, Schedule
			can :manage, Level
			can :manage, Coach
			can :manage, RecitalAd
		end

		if user.role == "moderator" #Managers, Office Staff
			can :manage, Comment
			can :manage, KidQuote
			can :manage, Schedule
			can :manage, Level
			can :manage, Coach
			can :manage, RecitalAd
			cannot :destroy, Level
		end 

		if user.role == "author" #Not logged in
			can :read, Comment
			can :create, Comment
			cannot :show, Comment
			can :read, Schedule
			can :read, Coach
			can :create, RecitalAd
		end
	end 
end