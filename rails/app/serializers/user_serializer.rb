class UserSerializer < ActiveModel::Serializer
  embed :ids, include: true

  attributes :id, :name, :photo
  has_many :identities
end
