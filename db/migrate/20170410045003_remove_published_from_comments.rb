class RemovePublishedFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :published, :date
  end
end
