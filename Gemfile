source 'https://rubygems.org'
ruby '2.3.4'

gem 'rails', '5.0'
gem 'pg', "~> 0.21" #1.0.0 is the current version but not yet supported by rails
gem 'sass-rails'
gem 'coffee-rails'
gem 'uglifier'

gem 'jquery-rails'

gem 'yaml_db'
gem 'therubyracer'

gem 'jquery-ui-rails'
gem 'jquery-minicolors-rails'
# gem 'jquery-validation-rails'


group :development do
	# gem 'better_errors'
	# gem 'binding_of_caller'
	# gem 'quiet_assets'
	# gem 'byebug'
	gem 'web-console' #put <%= console %> on any page I want a console to show on the error page
end

group :production do
	gem "rack-timeout" # causing problems locally
	gem 'rails_12factor' # allows stdout logging, which is on by default in development
end

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '3.1.2'

gem 'thin'
gem 'cancancan'
gem 'kaminari' #pagination - https://github.com/kaminari/kaminari

gem "carrierwave", "0.11.2"
gem 'mini_magick', ">= 4.9.4"
gem 'fog-google'

gem "fancybox2-rails"

gem "stripe"

gem 'google-analytics-rails'
# gem "client_side_validations"

gem 'mailgun-ruby', '~>1.1.6'
gem 'premailer-rails'
gem "nokogiri", ">= 1.10.4"

gem 'foundation-rails'

gem 'httparty' #needed to get json info from jackrabbit

gem "awesome_print" #used to make the console pretty
