# Load the Rails application.
require File.expand_path('../application', __FILE__)

if defined?(APP_CONFIG).nil?
  if File.exists?("#{Rails.root}/config/config.yml")
    APP_CONFIG = YAML.load_file("#{Rails.root}/config/config.yml")[Rails.env].symbolize_keys
  else
    APP_CONFIG = {development: {}, test: {}, staging: {}, production: {}}
  end
end


# Initialize the Rails application.
Rails.application.initialize!
