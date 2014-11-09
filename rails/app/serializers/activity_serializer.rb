class ActivitySerializer < ActiveModel::Serializer
  embed :ids, include: true

  attributes :id, :provider, :url, :percentages
  has_one :user

  def percentages
    object.all_percentages
  end
end
