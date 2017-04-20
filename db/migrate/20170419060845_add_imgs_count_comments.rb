class AddImgsCountComments < ActiveRecord::Migration
  def change
      change_table :comments do |t|
        t.integer :comment_imgs_count, default: 0
      end
  end
end
