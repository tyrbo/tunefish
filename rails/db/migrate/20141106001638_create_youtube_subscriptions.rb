class CreateYoutubeSubscriptions < ActiveRecord::Migration
  def change
    create_table :youtube_subscriptions do |t|
      t.references :user, index: true
      t.string :channel_id
      t.string :title
      t.boolean :tracked, default: false
      t.timestamps
    end
  end
end
