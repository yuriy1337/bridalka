source 'http://rubygems.org'

gem 'rails', '3.2.3'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'
group :production do
  gem "passenger"
  gem "mysql2"
end

group :development, :test do
  gem "sqlite3"
  gem 'capistrano'
  gem 'rvm-capistrano'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'#,   '= 3.1.4'
  gem 'coffee-rails'#, '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

gem "compass", ">= 0.11.5"
gem 'jquery-rails'

#mail sending
gem 'mail'
gem 'actionmailer'

#validate emails
gem 'active-model-email-validator'

#twitter bootstrap
gem 'compass_twitter_bootstrap'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~ > 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test do
  # Pretty printed test output
  gem 'turn', '~> 0.8.3', :require => false
end
