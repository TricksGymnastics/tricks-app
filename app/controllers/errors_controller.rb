class ErrorsController < ApplicationController
	def show
		@exception = env["action_dispatch.exception"]
		render action: request.path[1..-1]
		email = ErrorMailer.error_details(@exception).deliver_now
		# email.delivery_method.settings.merge!({user_name: ENV['GMAIL_WEBMASTER_ID'], password: ENV['GMAIL_WEBMASTER_PASSWORD']}) #for using non default email
		# email.deliver_now
	end  
end
