Sidekiq.configure_server do |config|
    config.redis = { url: 'redis://localhost:6379/0' } # Update with your Redis configuration
  end
  
  Sidekiq.configure_client do |config|
    config.redis = { url: 'redis://localhost:6379/0' } # Update with your Redis configuration
  end
  