class AddAllowedToLogInToUsers < ActiveRecord::Migration
  def change
    add_column :users, :allowed_to_log_in, :boolean, :default => true
  end
end
