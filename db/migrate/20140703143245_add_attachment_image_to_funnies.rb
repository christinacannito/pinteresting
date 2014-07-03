class AddAttachmentImageToFunnies < ActiveRecord::Migration
  def self.up
    change_table :funnies do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :funnies, :image
  end
end
