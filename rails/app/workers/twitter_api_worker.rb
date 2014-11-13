class TwitterAPIWorker
  include Sidekiq::Worker

  def perform(twitter_screen_name, user_id)
    twitter = TwitterAPI.new(twitter_screen_name: twitter_screen_name)
    tweets = twitter.get_tweets_with_hashtag_tf
    tweet_ids = tweets.map { |tweet| tweet.id }
    oembed_tweets = twitter.get_oembed_tweets(tweet_ids)

    new_tweets = oembed_tweets.map do |tweet|
      oembed_html = tweet.html
      TwitterActivity.find_or_create_by(url: oembed_html, user_id: user_id, provider: 'twitter') do |x|
        x
      end
    end

    new_tweets.each { |x| Pusher.trigger("user_#{user_id}", 'activity', x.to_json) }
  end
end
