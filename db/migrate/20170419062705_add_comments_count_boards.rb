class AddCommentsCountBoards < ActiveRecord::Migration
  def change
    change_table :boards do |t|
      t.integer :comments_count, default: 0
    end
  end
end
