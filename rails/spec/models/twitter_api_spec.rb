require 'rails_helper'

describe TwitterAPI, type: :model do
  it 'gets tweets with the hashtag #tf' do
    twitter = TwitterAPI.new(twitter_screen_name: 'will_faurot')

    VCR.use_cassette('twitter/tweets') do
      tweets = twitter.get_tweets_with_hashtag_tf
      expect(tweets).to be_an_instance_of Array
      tweets.each do |tweet|
        words = tweet.text.split
        expect(words).to include '#tf'
      end
    end
  end
end
