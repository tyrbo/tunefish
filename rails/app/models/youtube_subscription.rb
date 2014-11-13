class YoutubeSubscription < ActiveRecord::Base
  belongs_to :user
  has_many :activities

  scope :tracked,    -> { where(tracked: true) }
  scope :untracked,    -> { where(tracked: false) }
end
