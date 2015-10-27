class AddCrewToUsers < ActiveRecord::Migration
  def change
    add_column :users, :crew, :string
  end
end
