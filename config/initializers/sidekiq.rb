Sidekiq.configure_client do |config|
  config.redis = {url: ENV["REDIS_URL"], size: 5, network_timeout: 5}
end
Sidekiq.configure_server do |config|
  config.redis = {url: ENV["REDIS_URL"], size: 5, network_timeout: 5}
end
