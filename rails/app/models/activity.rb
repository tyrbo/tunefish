class Activity < ActiveRecord::Base
  belongs_to :user

  scope :youtube, -> { where(type: "YoutubeActivity") }
end
