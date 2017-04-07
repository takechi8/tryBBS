class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :board_id
      t.string :name
      t.string :sentence
      t.date :published

      t.timestamps null: false
    end
  end
end
