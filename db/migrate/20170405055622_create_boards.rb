class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :name
      t.string :title
      t.date :published

      t.timestamps null: false
    end
  end
end
