class SubscriptionSerializer < ActiveModel::Serializer
  embed :ids, include: true
  
  attributes :id, :follower_id, :followed_id
  has_many :following
end
