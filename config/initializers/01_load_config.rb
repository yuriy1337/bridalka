APP_CONFIG = YAML.load_file("#{Rails.root}/config/config.yml")[Rails.env] unless !APP_CONFIG.nil?
#moved to environment.rb