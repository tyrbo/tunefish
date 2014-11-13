class AddYoutubeSubscriptionIdToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :youtube_subscription_id, :integer
  end
end
