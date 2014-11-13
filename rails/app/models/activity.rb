class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :youtube_subscription

  scope :youtube,    -> { where(type: "YoutubeActivity") }
  scope :soundcloud, -> { where(type: "SoundcloudActivity") }
  scope :twitter,    -> { where(type: "TwitterActivity") }

end
