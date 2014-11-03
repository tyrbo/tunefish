class Activity < ActiveRecord::Base
  belongs_to :feed

  scope :youtube, -> { where(type: "YoutubeActivity") }
end
