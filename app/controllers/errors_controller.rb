class ErrorsController < ApplicationController
	def show
		@url = request.original_url

		#fixed errors based on https://stackoverflow.com/questions/58921104/custom-error-handling-no-longer-works-after-upgrading-from-rails-4-to-rails-5
		@exception = request.env["action_dispatch.exception"]
		# got these 2 lines from that page too, maybe they do something cool
		exception_wrapper = ActionDispatch::ExceptionWrapper.new(request.env['action_dispatch.backtrace_cleaner'], @exception)
		@trace = exception_wrapper.application_trace

		render action: request.path[1..-1]
		if params[:status] != "404"
			ErrorMailer.error_details(@url, @exception, @trace).deliver_now
		end
		# email = ErrorMailer.error_details(@exception).deliver_now
		# email.delivery_method.settings.merge!({user_name: ENV['GMAIL_WEBMASTER_ID'], password: ENV['GMAIL_WEBMASTER_PASSWORD']}) #for using non default email
		# email.deliver_now
	end  
end
