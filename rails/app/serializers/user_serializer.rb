class UserSerializer < ActiveModel::Serializer
  embed :ids, include: true

  attributes :id, :name, :photo, :created_at
  has_many :activities
  has_many :subscriptions
end
