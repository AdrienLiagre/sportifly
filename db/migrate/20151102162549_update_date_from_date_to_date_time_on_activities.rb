class UpdateDateFromDateToDateTimeOnActivities < ActiveRecord::Migration
  def change
    change_column :activities, :date, :datetime
  end
end
