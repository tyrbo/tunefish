class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :youtube_subscription

  scope :youtube,    -> { where(type: "YoutubeActivity") }
  scope :soundcloud, -> { where(type: "SoundcloudActivity") }
  scope :twitter,    -> { where(type: "TwitterActivity") }

  def as_json(options = { })
    super((options || { }).merge({
        :methods => [:uid]
    }))
  end

  def uid
    user_id
  end
end
