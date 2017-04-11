class RemovePublishedFromBoards < ActiveRecord::Migration
  def change
    remove_column :boards, :published, :date
  end
end
