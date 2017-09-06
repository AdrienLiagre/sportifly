class AddPinnedToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :pinned, :boolean
  end
end
