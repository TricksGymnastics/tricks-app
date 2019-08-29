# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w( FileSpecificCSS/* recital_ad/* dance_company/* schedule/* static/* )

# not sure if everything below this is still needed or not
# Rails.application.config.assets.paths << Rails.root.join("app", "assets", "fonts")

  # # Generate digests for assets URLs
  # config.assets.digest = true

  # # Add the fonts path
  # config.assets.paths << Rails.root.join('app', 'assets', 'fonts')

  # # Precompile additional assets
  # config.assets.precompile += %w( .svg .eot .woff .tff )