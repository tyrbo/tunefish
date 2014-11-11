class User < ActiveRecord::Base
  has_many  :activities
  has_many  :identities
  has_many  :youtube_subscriptions

  def self.create_from_hash!(hash)
    create(:name => hash['info']['name'], :photo => hash['info']['image'])
  end

  def google_identity
    self.identities.find_by(provider: 'google_oauth2')
  end

  def google_token
   "Bearer #{ google_identity.token}"
  end

  def parse_subscriptions(subscriptions_response_string)
    subscriptions = JSON.parse(subscriptions_response_string)
    channels = {}

    subscriptions['items'].each do |channel|
      title = channel['snippet']['title']
      channel_id = channel['snippet']['resourceId']['channelId']
      channels[title] = channel_id
    end

    channels
  end

  # This method accepts an array of channel ids that will be coming back
  # in some form from an ember ajax post request
  def add_tracked_subscriptions(channel_ids)
    channel_ids.each do |channel_id|
      ys = self.youtube_subscriptions.find_by(channel_id: channel_id)
      ys.update_attributes(tracked: true) if ys
    end
  end
end
