class AddSportToActivities < ActiveRecord::Migration
  def change
    add_reference :activities, :sport, index: true, foreign_key: true
  end
end
