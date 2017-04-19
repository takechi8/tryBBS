class CreateCommentImgs < ActiveRecord::Migration
  def change
    create_table :comment_imgs do |t|
      t.integer :comment_id

      t.timestamps null: false
    end
  end
end
