class AddLocationToActivities < ActiveRecord::Migration
  def change
    add_reference :activities, :location, index: true, foreign_key: true
  end
end
