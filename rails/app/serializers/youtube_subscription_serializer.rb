class YoutubeSubscriptionSerializer < ActiveModel::Serializer
  embed :ids, include: true

  attributes :id, :title, :tracked
end
