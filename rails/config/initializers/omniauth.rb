Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :twitter, ENV['twitter_key'], ENV['twitter_secret']
  provider :lastfm, ENV['lastfm_key'], ENV['lastfm_secret']
  provider :google_oauth2, ENV["google_key"], ENV["google_secret"]
  provider :soundcloud, ENV['soundcloud_key'], ENV['soundcloud_secret']
end
