class Activity < ActiveRecord::Base
  belongs_to :user

  scope :youtube,    -> { where(type: "YoutubeActivity") }
  scope :lastfm,     -> { where(type: "LastfmActivity") }
  scope :soundcloud, -> { where(type: "SoundcloudActivity") }
  scope :twitter,    -> { where(type: "TwitterActivity") }
end
