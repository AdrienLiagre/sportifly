class AddOriginToToken < ActiveRecord::Migration
  def change
    add_column :tokens, :original_id, :integer
  end
end
