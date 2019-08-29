source 'https://rubygems.org'

ruby '2.3.4'
gem 'rails', '5.2.3'

gem 'pg', "1.0.0"
gem 'sass-rails'
gem 'coffee-rails'
gem 'uglifier'
gem 'yaml_db'
gem 'therubyracer'

group :development do
	# gem 'better_errors'
	# gem 'binding_of_caller'
	# gem 'quiet_assets'
	# gem 'byebug'
	# put <%= console %> on any page I want a console to show on the error page
	gem 'web-console' 
end

group :production do
	# Sets a specific timeout for some actions so they don't cause the server to hang until crash
	gem "rack-timeout" # causing problems locally
	# Heroku says we should have this one
	gem 'rails_12factor'
end

# Adds use of jQuery
gem 'jquery-rails'
# Adds jQuery-UI. Used for a few different visual effects accross the site
gem 'jquery-ui-rails'
# Adds jQuery.minicolors. Used for creating color pickers to forms
gem 'jquery-minicolors-rails'

# To use ActiveModel has_secure_password
gem 'bcrypt'

# Local web server?
gem 'thin'

# Role specific permissions definied in Ability.rb
gem 'cancancan'

#pagination - https://github.com/kaminari/kaminari
gem 'kaminari'

# File uploads
gem "carrierwave", "0.11.2"
# Image manipulation (resize, rotate, scale)
gem 'mini_magick', ">= 4.9.4"
# File storage solution
gem 'fog-google'

# Used to integrate with stripe.com for payment handling
gem "stripe"

# Google Analytics
gem 'google-analytics-rails'

# Service used for sending email
gem 'mailgun-ruby', '~>1.1.6'

# Allows for CSS styling to be applied to emails from <style> tags or other files
# instead of only in style="" attr
gem 'premailer-rails' 

# CSS Framework
gem 'foundation-rails'

# Allows making http requests and waiting for responses. Needed to get json class infor from jackrabbit
gem 'httparty'