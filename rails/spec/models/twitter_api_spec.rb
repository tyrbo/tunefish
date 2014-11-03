require 'rails_helper'

describe TwitterAPI, type: :model do
  before do
    @twitter = TwitterAPI.new(twitter_screen_name: 'will_faurot')
  end

  it 'gets tweets with the hashtag #tf' do
    VCR.use_cassette('twitter/tweets') do
      tweets = @twitter.get_tweets_with_hashtag_tf
      expect(tweets).to be_an_instance_of Array
      tweets.each do |tweet|
        words = tweet.text.split
        expect(words).to include '#tf'
      end
    end
  end

  describe '#get_ombed_tweets' do
    it 'returns an array of Twitter::OEmbed objects' do
      VCR.use_cassette('twitter/oembed') do
        tweet_ids = ['529292521097416705']
        tweets = @twitter.get_oembed_tweets(tweet_ids)
        expect(tweets.first).to be_an_instance_of Twitter::OEmbed
      end
    end
  end
end
