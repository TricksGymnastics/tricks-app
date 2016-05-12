class ErrorsController < ApplicationController
    layout 'static'
	def show
		if params[:status] != "404"
			@exception = env["action_dispatch.exception"]
			render action: request.path[1..-1]
			email = ErrorMailer.error_details(@exception)
			email.delivery_method.settings.merge!({user_name: ENV['GMAIL_WEBMASTER_ID'], password: ENV['GMAIL_WEBMASTER_PASSWORD']})
			email.deliver
		end
	end
end
