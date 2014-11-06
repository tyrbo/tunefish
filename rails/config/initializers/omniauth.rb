Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :twitter, ENV['twitter_key'], ENV['twitter_secret']
  provider :lastfm, ENV['lastfm_key'], ENV['lastfm_secret']
  provider :google_oauth2, ENV["google_client_id"], ENV["google_secret"],
    {
    scope:"email, profile, http://gdata.youtube.com"
    }
  provider :soundcloud, ENV['soundcloud_key'], ENV['soundcloud_secret']
end

if Rails.env.production?
  OmniAuth.config.full_host = "https://api.tunefi.sh"
end
