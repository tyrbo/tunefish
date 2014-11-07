class YoutubeSubscriptionSerializer < ActiveModel::Serializer
  embed :ids, include: true

  attributes :title, :channel_id, :tracked
  has_one :user
end