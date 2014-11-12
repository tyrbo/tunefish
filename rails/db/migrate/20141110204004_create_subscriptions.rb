class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps
    end
    add_index :subscriptions, :follower_id
    add_index :subscriptions, :followed_id
    add_index :subscriptions, [:follower_id, :followed_id], unique: true
  end
end
