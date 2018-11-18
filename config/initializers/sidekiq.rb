setting = YAML.load(File.read(File.expand_path(File.dirname(__FILE__) + "/../redis.yml")))

Sidekiq.configure_server do |config|
  config.redis = { url: "redis://#{setting[Rails.env]['host']}:#{setting[Rails.env]['port']}", namespace: "sidekiq_#{Rails.env}" }
end

Sidekiq.configure_client do |config|
  config.redis = { url: "redis://#{setting[Rails.env]['host']}:#{setting[Rails.env]['port']}", namespace: "sidekiq_#{Rails.env}" }
end