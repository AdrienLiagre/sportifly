class AddAttachmentPictureToSports < ActiveRecord::Migration
  def self.up
    change_table :sports do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :sports, :picture
  end
end
