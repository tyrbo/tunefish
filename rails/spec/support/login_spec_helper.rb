module LoginSpecHelper
  def google_login_request
    valid_google_oauth2_login
    get "auth/google_oauth2/callback"
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
  end

  def twitter_login_request
    valid_twitter_login
    get "auth/twitter/callback"
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter]
  end

  def lastfm_login_request
    valid_lastfm_login
    get "auth/lastfm/callback"
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:lastfm]
  end

  def soundcloud_login_request
    valid_soundcloud_login
    get "auth/soundcloud/callback"
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:soundcloud]
  end
end
