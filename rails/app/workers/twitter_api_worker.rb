class TwitterAPIWorker
  include Sidekiq::Worker

  # Here we're using the twitter gem, tweets will be custom Tweet objects
  # as opposed to raw JSON like with some of the other APIs.
  def perform(twitter_screen_name, user_id)
    twitter = TwitterAPI.new(twitter_screen_name: twitter_screen_name)
    tweets = twitter.get_tweets_with_hashtag_tf
    # might want to rethink this interface eventually, could be more clean
    # to have the method deal wiht one id, im not sure how I feel having the caller
    # be responsible mapping tweet ids
    tweet_ids = tweets.map { |tweet| tweet.id }
    oembed_tweets = twitter.get_oembed_tweets(tweet_ids)

    oembed_tweets.each do |tweet|
      oembed_html = tweet.html
      TwitterActivity.find_or_create_by(url: oembed_html,
                                        user_id: user_id,
                                        provider: 'twitter')
    end
  end
end
