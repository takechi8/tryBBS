class AddColumnsComments < ActiveRecord::Migration
  def change
		change_table :comments do |t|
      t.date :public_start_date
      t.date :public_end_date
      t.boolean :public_presence
    end
  end
end

