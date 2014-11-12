class TwitterAPI
  def initialize(twitter_oauth_token: '', twitter_oauth_secret: '', twitter_screen_name: '')
    @twitter_oauth_token = twitter_oauth_token
    @twitter_oauth_secret = twitter_oauth_secret
    @twitter_screen_name = twitter_screen_name
  end

  def get_tweets_with_hashtag_tf
    binding.pry
    tweets = client.user_timeline(@twitter_screen_name)
    tweets.select do |tweet|
      words = tweet.text.split
      words.include?('#tf')
    end
  end

  def get_oembed_tweets(tweet_ids)
    tweet_ids.map { |id| client.oembed(id) }
  end

  private

  def client
    Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['twitter_key']
      config.consumer_secret     = ENV['twitter_secret']
      config.access_token        = @twitter_oauth_token
      config.access_token_secret = @twitter_oauth_secret
    end
  end
end
