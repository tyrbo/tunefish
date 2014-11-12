user1 = User.create(name: "Jon Snow")
user2 = User.create(name: "Ned Stark")
user3 = User.create(name: "Will Faurot")
user4 = User.create(name: "Allison Larson")

YoutubeActivity.create(provider: "youtube", url: "//www.youtube.com/embed/VO3__R3LWJ0", user_id: user1.id)
SoundcloudActivity.create(provider: "soundcloud", url: "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/163306920&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true", user_id: user1.id)
TwitterActivity.create(provider: "twitter", user_id: user1.id, url: "\u003Cblockquote
                                                  class=\"twitter-tweet\"\u003E\u003Cp\u003E\u003Ca href=\"https:\/\/twitter.com\/hashtag\/tf?src=hash\"\u003E#tf\u003C\/a\u003E\u003C\/p\u003E&mdash;
                                                  Will Faurot (@Will_Faurot) \u003Ca href=\"https:\/\/twitter.com\/Will_Faurot\/status\/529292521097416705\"\u003ENovember
                                                  3, 2014\u003C\/a\u003E\u003C\/blockquote\u003E\n\u003Cscript async src=\"\/\/platform.twitter.com\/widgets.js\"
                                                  charset=\"utf-8\"\u003E\u003C\/script\u003Eki")

YoutubeActivity.create(provider: "youtube", url: "//www.youtube.com/embed/VO3__R3LWJ0", user_id: user2.id)
SoundcloudActivity.create(provider: "soundcloud", url: "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/163306920&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true", user_id: user2.id)
TwitterActivity.create(provider: "twitter", user_id: user2.id, url: "\u003Cblockquote
                                                  class=\"twitter-tweet\"\u003E\u003Cp\u003E\u003Ca href=\"https:\/\/twitter.com\/hashtag\/tf?src=hash\"\u003E#tf\u003C\/a\u003E\u003C\/p\u003E&mdash;
                                                  Will Faurot (@Will_Faurot) \u003Ca href=\"https:\/\/twitter.com\/Will_Faurot\/status\/529292521097416705\"\u003ENovember
                                                  3, 2014\u003C\/a\u003E\u003C\/blockquote\u003E\n\u003Cscript async src=\"\/\/platform.twitter.com\/widgets.js\"
                                                  charset=\"utf-8\"\u003E\u003C\/script\u003Eki")

YoutubeActivity.create(provider: "youtube", url: "//www.youtube.com/embed/VO3__R3LWJ0", user_id: user3.id)
SoundcloudActivity.create(provider: "soundcloud", url: "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/163306920&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true", user_id: user3.id)
TwitterActivity.create(provider: "twitter", user_id: user3.id, url: "\u003Cblockquote
                                                  class=\"twitter-tweet\"\u003E\u003Cp\u003E\u003Ca href=\"https:\/\/twitter.com\/hashtag\/tf?src=hash\"\u003E#tf\u003C\/a\u003E\u003C\/p\u003E&mdash;
                                                  Will Faurot (@Will_Faurot) \u003Ca href=\"https:\/\/twitter.com\/Will_Faurot\/status\/529292521097416705\"\u003ENovember
                                                  3, 2014\u003C\/a\u003E\u003C\/blockquote\u003E\n\u003Cscript async src=\"\/\/platform.twitter.com\/widgets.js\"
                                                  charset=\"utf-8\"\u003E\u003C\/script\u003Eki")

YoutubeActivity.create(provider: "youtube", url: "//www.youtube.com/embed/VO3__R3LWJ0", user_id: user4.id)
SoundcloudActivity.create(provider: "soundcloud", url: "https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/163306920&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true", user_id: user4.id)
TwitterActivity.create(provider: "twitter", user_id: user4.id, url: "\u003Cblockquote
                                                  class=\"twitter-tweet\"\u003E\u003Cp\u003E\u003Ca href=\"https:\/\/twitter.com\/hashtag\/tf?src=hash\"\u003E#tf\u003C\/a\u003E\u003C\/p\u003E&mdash;
                                                  Will Faurot (@Will_Faurot) \u003Ca href=\"https:\/\/twitter.com\/Will_Faurot\/status\/529292521097416705\"\u003ENovember
                                                  3, 2014\u003C\/a\u003E\u003C\/blockquote\u003E\n\u003Cscript async src=\"\/\/platform.twitter.com\/widgets.js\"
                                                  charset=\"utf-8\"\u003E\u003C\/script\u003Eki")

