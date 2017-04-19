class AddAttachmentImgToCommentImgs < ActiveRecord::Migration
  def self.up
    change_table :comment_imgs do |t|
      t.attachment :img
    end
  end

  def self.down
    remove_attachment :comment_imgs, :img
  end
end
