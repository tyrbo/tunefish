class User < ActiveRecord::Base
  has_many :identities
  serialize :tracked_subscriptions

  def self.create_from_hash!(hash)
    create(:name => hash['info']['name'])
  end

  def google_identity
    self.identities.find_by(provider: 'google_oauth2')
  end

  def google_token
    google_identity.token
  end

  def subscriptions(json)
    subscriptions = JSON.parse json
    channels = {}

    subscriptions['items'].each do |channel|
      title = channel['snippet']['title']
      channel_id = channel['snippet']['resourceId']['channelId']
      channels[title] = channel_id
    end

    channels
  end

  def add_tracked_subscriptions(subscriptions_hash)
    tracked_subscriptions = subscriptions_hash.values
    update(tracked_subscriptions: tracked_subscriptions)
  end
end
