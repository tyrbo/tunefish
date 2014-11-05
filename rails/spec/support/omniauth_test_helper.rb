module OmniAuthTestHelper
  def valid_twitter_login
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
      provider: 'twitter',
      uid: '123545',
      info: {
        name: "Jon",
        last_name:  "Snow",
        email:      "test@example.com"
      },
      credentials: {
        token: "123456",
        refresh_token: "", 
        expires_at: Time.now + 1.week
      },
      extra: {
        raw_info: {
          gender: 'male'
        }
      }
    })
  end

  def valid_lastfm_login
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:lastfm] = OmniAuth::AuthHash.new({
      provider: 'lastfm',
      uid: '123546',
      info: {
        name: "Katherine",
        last_name:  "Stark",
        email:      "test@example.com"
      },
      credentials: {
        token: "123456",
        expires_at: Time.now + 1.week
      },
      extra: {
        raw_info: {
          gender: 'female'
        }
      }
    })
  end

  def valid_google_oauth2_login
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
      provider: 'google_oauth2',
      uid: '123546',
      info: {
        name: "Ned",
        last_name:  "Stark",
        email:      "test@example.com"
      },
      credentials: {
        token: "123456",
        expires_at: Time.now + 1.week
      },
      extra: {
        raw_info: {
          gender: 'male'
        }
      }
    })
  end

  def valid_soundcloud_login
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:soundcloud] = OmniAuth::AuthHash.new({
      provider: 'soundcloud',
      uid: '123546',
      info: {
        name: "Daenerys",
        last_name:  "Targaryen",
        email:      "test@example.com"
      },
      credentials: {
        token: "123456",
        expires_at: Time.now + 1.week
      },
      extra: {
        raw_info: {
          id: '12345',
          gender: 'female'
        }
      }
    })
  end
end
