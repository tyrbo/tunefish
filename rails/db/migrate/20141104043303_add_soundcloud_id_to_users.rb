class AddSoundcloudIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :soundcloud_user_id, :string
  end
end
