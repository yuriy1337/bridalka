source 'http://rubygems.org'

gem 'rails', '4.1.7'
gem 'railties'

group :production do
  gem 'passenger'
  gem 'mysql2'
end

group :development, :test do
  gem 'sqlite3'
  gem 'capistrano', '~> 3.2.0'
  gem 'rvm1-capistrano3', require: false
end

gem 'sass-rails'
gem 'coffee-rails'
gem 'uglifier'

# TODO figure out this mess: http://stackoverflow.com/questions/26416065/which-gem-is-breaking-rails-application-css-scss-wrong-number-of-arguments-3-for
gem 'sass', '~> 3.2.19'
gem 'compass', '~> 0.12.7'
gem 'compass-rails', '~> 2.0.0'

#validate phone number
gem 'validates_as_phone_number'
gem 'sixarm_ruby_email_address_validation'

#gem 'compass'
#gem 'compass-rails'
gem 'compass-blueprint'

#mail sending
gem 'mail'
gem 'actionmailer'

#validate emails
gem 'active-model-email-validator'

#twitter bootstrap
gem 'compass_twitter_bootstrap'

#uploads
gem 'rmagick'
gem 'carrierwave'

# admin panel
gem 'devise'
gem 'rails_admin'

gem 'yui-compressor'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~ > 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin]

group :test do
  # Pretty printed test output
  gem 'turn', '~> 0.8.3', :require => false
end
