class User < ActiveRecord::Base
  has_many :identities

  def self.create_from_hash!(hash)
    create(:name => hash['info']['first_name'])
  end

  def google_identity
    self.identities.find_by(provider: 'google_oauth2')
  end

  def google_token
    google_identity.token
  end

  def subscriptions(json)
    channels = {}

    json['items'].each do |channel|
      title = channel['snippet']['title']
      channel_id = channel['snippet']['resourceId']['channelId']
      channels[title] = channel_id
    end

    channels
  end

  def add_tracked_subscriptions(subscriptions_hash)
    tracked_subscriptions = subscriptions_hash.values.to_json
    update(tracked_subscriptions: tracked_subscriptions)
  end

  def parsed_tracked_subscriptions
    JSON.parse tracked_subscriptions
  end
end
