require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'compass'
require 'sass-rails'

module Compass
  RAILS_LOADED = true
end

if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  Bundler.require(*Rails.groups(:assets => %w(development test)))
  Bundler.require(:default, :assets, Rails.env)
  # If you want your assets lazily compiled in production, use this line
  # Bundler.require(:default, :assets, Rails.env)
end

module Bridalka
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Custom directories with classes and modules you want to be autoloadable.
    # config.autoload_paths += %W(#{config.root}/extras)

    # Only load the plugins named here, in the order given (default is alphabetical).
    # :all can be used as a placeholder for all plugins not explicitly named.
    # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

    # Activate observers that should always be running.
    # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]

    # Enable the asset pipeline
    config.assets.enabled = true

    # Version of your assets, change this if you want to expire all your assets
    config.assets.version = '1.0'
    
    # Serving static assets and setting cache headers 
    config.serve_static_assets = true
    config.static_cache_control = "public, max-age=31536000"
    
    config.sass.load_paths << Compass::Frameworks['compass'].stylesheets_directory
    config.sass.load_paths << Compass::Frameworks['blueprint'].stylesheets_directory
    config.sass.load_paths << Compass::Frameworks['twitter_bootstrap'].stylesheets_directory
	
	  config.assets.initialize_on_precompile = false
	#custom field error
	ActionView::Base.field_error_proc = Proc.new do |html_tag, instance_tag|
		"<span class='control-group error'>#{html_tag}</span>".html_safe
	end
  end
end
