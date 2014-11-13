class UserSerializer < ActiveModel::Serializer
  embed :ids, include: true

  attributes :id, :name, :photo, :created_at
  has_many :activities
  has_many :subscriptions

  def activities
    scoped_activities = object.activities.order('id DESC').select do |activity|
      if activity.youtube_subscription
        if activity.youtube_subscription.tracked
          activity
        end
      else
        activity
      end
    end
  end
end
