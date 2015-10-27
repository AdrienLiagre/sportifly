class AddAttachmentPictureToNewsfeeds < ActiveRecord::Migration
  def self.up
    change_table :newsfeeds do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :newsfeeds, :picture
  end
end
