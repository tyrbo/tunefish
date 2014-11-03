class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :type
      t.string :url
      t.integer :feed_id
      t.timestamps
    end
  end
end
