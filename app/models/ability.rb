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
			can :manage, World
			can :manage, TricksUCategory
			can :manage, TricksUVideo
			can :manage, DiscontinueNotice
			can :manage, WebsitePdf
			can :manage, Camp
			can :manage, Party
			cab :manage, BubbleContent
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
			can :manage, DiscontinueNotice
			can :read, WebsitePdf
			can :create, WebsitePdf
			can :read, World
			can :create, World
			can :read, TricksUVideo
			can :show, TricksUCategory
			cannot :destroy, Survey
			cannot :destroy, SurveyResult
			cannot :destroy, Level
			can :manage, Camp
			cannot :destroy, Camp
			can :manage, Party
			cannot :destroy, Party
		end 

		if user.role == "coach"
			can :read, TricksUVideo
			can :show, TricksUCategory
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
			can :create, World
			can :read, Level
			can :create, DiscontinueNotice
		end
	end 
end