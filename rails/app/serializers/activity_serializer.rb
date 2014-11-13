class ActivitySerializer < ActiveModel::Serializer
  embed :ids, include: true

  attributes :id, :provider, :url, :uid
  has_one :user
end
