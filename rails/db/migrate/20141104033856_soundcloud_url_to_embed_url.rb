class SoundcloudUrlToEmbedUrl < ActiveRecord::Migration
  def change
    change_column :activities, :url, :text
  end
end
