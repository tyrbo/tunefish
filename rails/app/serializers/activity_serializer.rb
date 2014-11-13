class ActivitySerializer < ActiveModel::Serializer
  embed :ids, include: true

  attributes :id, :provider, :url, :user_id
  has_one :user
end
