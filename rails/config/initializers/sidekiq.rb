if Rails.env.production?
  Sidekiq.configure_server do |config|
    config.redis = { url: 'redis://10.132.186.88:6379/0' }
  end

  Sidekiq.configure_client do |config|
    config.redis = { url: 'redis://10.132.186.88:6379/0' }
  end
end

