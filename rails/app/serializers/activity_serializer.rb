class ActivitySerializer < ActiveModel::Serializer
  embed :ids, include: true

  attributes :id, :provider, :url, :percentage
  has_one :user

  def youtube_percentage
    decimal_percentage = Activity.youtube.count.to_f/Activity.all.count.to_f
    float_percentage = decimal_percentage * 100
    float_percentage.to_i
  end

  def soundcloud_percentage
    decimal_percentage = Activity.soundcloud.count.to_f/Activity.all.count.to_f
    float_percentage = decimal_percentage * 100
    float_percentage.to_i
  end

  def twitter_percentage
    decimal_percentage = Activity.twitter.count.to_f/Activity.all.count.to_f
    float_percentage = decimal_percentage * 100
    float_percentage.to_i
  end

  def percentage
    send("#{provider}_percentage")
  end
end
