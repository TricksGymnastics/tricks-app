Comments::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
 config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = true

      # Change mail delvery to either :smtp, :sendmail, :file, :test
      # config.action_mailer.delivery_method = :smtp
      # config.action_mailer.smtp_settings = {
      #   address: "smtp.gmail.com",
      #   port: 587,
      #   domain: "dev.tricksgym.com",
      #   authentication: "plain",
      #   enable_starttls_auto: true,
      #   user_name: ENV['LOCAL_GMAIL_ACCOUNT'],
      #   password: ENV['LOCAL_GMAIL_PASSWORD']
      # }


  config.action_mailer.delivery_method = :mailgun
  config.action_mailer.mailgun_settings = {
    api_key: ENV['MAILGUN_API_KEY'],
    domain: 'mg.tricksgym.com',
  }
  
  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true


  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true
  
  # it was being stupid and not accepting the normal ip address of the server, so i just made it accept all of them
  # should be ok because this only happens in development
  config.web_console.whitelisted_ips = ['0.0.0.0/0'] 
  config.web_console.whiny_requests = true
  
  config.generators.assets = false
  config.generators.test_framework = nil
  config.generators.assets = false
  config.generators.helper = false
  config.generators.stylesheets = false
  config.time_zone = "Pacific Time (US & Canada)"
  
  config.action_mailer.default_url_options = { :host => "http://tricks-app-jtensai.c9users.io" }
  
   config.active_record.raise_in_transactional_callbacks = true
end
