class RemoveTrackedSubsFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :tracked_subscriptions
  end
end
