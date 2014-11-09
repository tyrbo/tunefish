class Activity < ActiveRecord::Base
  belongs_to :user

  scope :youtube,    -> { where(type: "YoutubeActivity") }
  scope :soundcloud, -> { where(type: "SoundcloudActivity") }
  scope :twitter,    -> { where(type: "TwitterActivity") }

  def self.youtube_percentage
    decimal_percentage = youtube.count.to_f/all.count.to_f
    float_percentage = decimal_percentage * 100
    float_percentage.to_i
  end

  def self.soundcloud_percentage
    decimal_percentage = soundcloud.count.to_f/all.count.to_f
    float_percentage = decimal_percentage * 100
    float_percentage.to_i
  end

  def self.twitter_percentage
    decimal_percentage = twitter.count.to_f/all.count.to_f
    float_percentage = decimal_percentage * 100
    float_percentage.to_i
  end
end
