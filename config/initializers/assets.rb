# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
Rails.application.config.assets.precompile += %w( jquery.min.js )
Rails.application.config.assets.precompile += %w( jquery-migrate.min.js )
Rails.application.config.assets.precompile += %w( bootstrap.bundle.min.js )
Rails.application.config.assets.precompile += %w( easing.min.js )
Rails.application.config.assets.precompile += %w( wow.min.js )
Rails.application.config.assets.precompile += %w( waypoints.min.js )
Rails.application.config.assets.precompile += %w( counterup.min.js )
Rails.application.config.assets.precompile += %w( hoverIntent.js )
Rails.application.config.assets.precompile += %w( superfish.min.js )
Rails.application.config.assets.precompile += %w( contactform.js )
Rails.application.config.assets.precompile += %w( slippry.min.js )
Rails.application.config.assets.precompile += %w( main.js )