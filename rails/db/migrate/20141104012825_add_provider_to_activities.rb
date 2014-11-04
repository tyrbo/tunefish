class AddProviderToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :provider, :string
  end
end
