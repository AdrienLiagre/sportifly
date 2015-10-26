class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.text :description
      t.string :email_domain_name

      t.timestamps null: false
    end
  end
end
