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
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({"provider"=>"google_oauth2",
       "uid"=>"114980540934310234294",
       "info"=>
        {"name"=>"Ned",
         "email"=>"hilarydenton90@gmail.com",
         "first_name"=>"Hilary",
         "last_name"=>"Denton",
         "image"=>"https://lh6.googleusercontent.com/-F6l_63vc8Zs/AAAAAAAAAAI/AAAAAAAAABA/kFKkZ6CfMUw/photo.jpg?sz=50",
         "urls"=>{"Google"=>"https://plus.google.com/114980540934310234294"}},
       "credentials"=>{"token"=>"ya29.vACqSJ_CrUClY2I8R2EUwyXuodVEILHHVAnKCib6n0tWI_rS3v2XeEIth7ItK1z4DauF8nZi1Fx-aQ", "expires_at"=>1415256708, "expires"=>false},
       "extra"=>
        {"id_token"=>
          "eyJhbGciOiJSUzI1NiIsImtpZCI6IjMzZWU0N2Y3NjkxNDVkZDZkM2Q4ZGUwZTYzZTY0ODgyMjBhY2I3OTYifQ.eyJpc3MiOiJhY2NvdW50cy5nb29nbGUuY29tIiwiaWQiOiIxMTQ5ODA1NDA5MzQzMTAyMzQyOTQiLCJzdWIiOiIxMTQ5ODA1NDA5MzQzMTAyMzQyOTQiLCJhenAiOiI1MTI0NTQwMjkwNDQtYWo1dmNqbmdrMXFsdWhzcHVlbDFmMnE4ZG9nc3ZpYXIuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJlbWFpbCI6ImhpbGFyeWRlbnRvbjkwQGdtYWlsLmNvbSIsImF0X2hhc2giOiI0dWpyODlNeDJKamdZZ0Z2VGdlNmFBIiwiZW1haWxfdmVyaWZpZWQiOnRydWUsImF1ZCI6IjUxMjQ1NDAyOTA0NC1hajV2Y2puZ2sxcWx1aHNwdWVsMWYycThkb2dzdmlhci5hcHBzLmdvb2dsZXVzZXJjb250ZW50LmNvbSIsInRva2VuX2hhc2giOiI0dWpyODlNeDJKamdZZ0Z2VGdlNmFBIiwidmVyaWZpZWRfZW1haWwiOnRydWUsImNpZCI6IjUxMjQ1NDAyOTA0NC1hajV2Y2puZ2sxcWx1aHNwdWVsMWYycThkb2dzdmlhci5hcHBzLmdvb2dsZXVzZXJjb250ZW50LmNvbSIsImlhdCI6MTQxNTI1MjgwNywiZXhwIjoxNDE1MjU2NzA3fQ.myNUGx_S90aDYQZDE4zEBr9YRU_98T-t2M_7mZU67wAbjulTxoqyKE4OqtTmHjmk50QsiEJUeHaYmyLllXCzmXblBvn3plg3J2GxhsHu8QOmrrQWK1r1XjF3m39hzMRJbSZedoHcrMz6J165B4lhJO2oahZ_CyCh2fLz9tRzq1I",
         "raw_info"=>
          {"kind"=>"plus#personOpenIdConnect",
           "gender"=>"female",
           "sub"=>"114980540934310234294",
           "name"=>"Hilary Denton",
           "given_name"=>"Hilary",
           "family_name"=>"Denton",
           "profile"=>"https://plus.google.com/114980540934310234294",
           "picture"=>"https://lh6.googleusercontent.com/-F6l_63vc8Zs/AAAAAAAAAAI/AAAAAAAAABA/kFKkZ6CfMUw/photo.jpg?sz=50",
           "email"=>"hilarydenton90@gmail.com",
           "email_verified"=>"true",
           "locale"=>"en"}}})
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
