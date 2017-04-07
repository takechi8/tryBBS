class AddImgToComments < ActiveRecord::Migration
  def self.up
    add_attachment :comments, :img
  end

  def self.down
    remove_attachment :comments, :img
  end
end
