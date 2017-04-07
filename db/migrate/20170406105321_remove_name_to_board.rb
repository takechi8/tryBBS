class RemoveNameToBoard < ActiveRecord::Migration
  def change
    remove_column :boards, :name, :string
  end
end
