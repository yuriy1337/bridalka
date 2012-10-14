ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.raise_delivery_errors = true if Rails.env.development?
#ActionMailer::Base.default_charset = "utf-8"

ActionMailer::Base.delivery_method = :smtp
if Rails.env.development?
  ActionMailer::Base.smtp_settings = {
  :enable_starttls_auto => true,
  :address => 'smtp.gmail.com',
  :port => 587,
  :authentication => :plain,
  :domain => 'gmail.com',
  :user_name => APP_CONFIG['username'],
  :password => APP_CONFIG['password'],
  #:openssl_verify_mode  => 'none'
}

else
ActionMailer::Base.smtp_settings = {
  :enable_starttls_auto => true,
  :address => 'mail.bridalkaleidoscope.com',
  :port => 587,
  :authentication => :plain,
  :domain => 'bridalkaleidoscope.com',
  :user_name => APP_CONFIG['username'],
  :password => APP_CONFIG['password'],
  :openssl_verify_mode  => 'none'
}
  
end

#puts "in setup mail"

if Rails.env.development?
 ActionMailer::Base.default_url_options[:host] = "localhost:3000" 
 #Mail.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?
end
if Rails.env.production?
  ActionMailer::Base.default_url_options[:host] = "bridalkaleidoscope.com"
end
