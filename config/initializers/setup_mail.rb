ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.raise_delivery_errors = true
#ActionMailer::Base.default_charset = "utf-8"

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :enable_starttls_auto => true,
  :address => 'mail.bridalkaleidoscope.com',
  :port => 587,
  :authentication => :plain,
  :domain => 'bridalkaleidoscope.com',
  :user_name => APP_CONFIG['username']
  :password => APP_CONFIG['password']
}

#puts "in setup mail"

ActionMailer::Base.default_url_options[:host] = "localhost:3000"
#Mail.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?
~
~
