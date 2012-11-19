#APP_CONFIG = YAML.load_file("#{Rails.root}/config/config.yml")[Rails.env]
# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Bridalka::Application.initialize!