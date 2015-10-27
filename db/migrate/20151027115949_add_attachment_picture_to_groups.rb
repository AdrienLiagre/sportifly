class AddAttachmentPictureToGroups < ActiveRecord::Migration
  def self.up
    change_table :groups do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :groups, :picture
  end
end
