class TwitterAPI
  def initialize(twitter_oauth_token: '', twitter_oauth_secret: '', twitter_screen_name: '')
    @twitter_oauth_token = twitter_oauth_token
    @twitter_oauth_secret = twitter_oauth_secret
    @twitter_screen_name = twitter_screen_name
  end

  def get_tweets_with_hashtag_tf
    tweets = client.user_timeline(@twitter_screen_name)
    tweets.select do |tweet|
      words = tweet.text.split
      words.include?('#tf')
    end
  end

  def get_oembed_tweets(tweet_ids)
    tweet_ids.map { |id| client.oembed(id) }
  end

  # This returns an array of html strings representing an embeeded
  # tweet that come back as part of the oembed response
  # def oembed_html_strings
  #   tweets = get_tweets_with_hashtag_tf
  #   tweet_ids = tweets.map { |tweet| tweet.id }
  #   tweet_ids.map do |id|
  #     tweet = get_oembed_tweet(id)
  #     tweet.html
  #   end
  # end

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
