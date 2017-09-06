class AddGroupIdToTokens < ActiveRecord::Migration
  def change
    add_column :tokens, :group_id, :integer
  end
end
