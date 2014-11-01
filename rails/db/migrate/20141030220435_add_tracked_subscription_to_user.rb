class AddTrackedSubscriptionToUser < ActiveRecord::Migration
  def change
    add_column :users, :tracked_subscriptions, :string
  end
end
