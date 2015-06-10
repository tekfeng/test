if defined?(APP_CONFIG).nil?
  APP_CONFIG = {development: {}, test: {}, staging: {}, production: {}}

  if File.exists?("#{Rails.root}/config/config.yml")
    APP_CONFIG = YAML.load_file("#{Rails.root}/config/config.yml")[Rails.env].symbolize_keys
  end
end