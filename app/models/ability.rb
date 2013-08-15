class Ability
	include CanCan::Ability

	def initialize(user) 
		user ||= User.new
			
		## List of Actions ##
		# :read (index)
		# :create (create)
		# :show (show)
		# :update (update)
		# :destroy (destroy)
		# :manage (all)

		## Object ##
		#Comment
		#KidQuote
		#User
		#Schedule
		#Level
		#Coach
		#RecitalAd
		#PromoSlide
		#Survey
		#SurveyResult
		#Datenight

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
			can :manage, Survey
			can :manage, SurveyResult
			can :manage, PromoSlide
			can :manage, User
			can :manage, Datenight
		end

		if user.role == "moderator" #Managers, Office Staff
			can :manage, Comment
			can :manage, KidQuote
			can :manage, Schedule
			can :manage, Level
			can :manage, Coach
			can :manage, RecitalAd
			can :manage, Survey
			can :manage, SurveyResult
			can :manage, Datenight
			cannot :destroy, Survey
			cannot :destroy, SurveyResult
			cannot :destroy, Level
		end 

		if user.role == "author" #Not logged in
			can :read, Comment
			can :create, Comment
			cannot :show, Comment
			can :read, Schedule
			can :read, Coach
			can :create, RecitalAd
			can :create, SurveyResult
			can :read, Survey
		end
	end 
end