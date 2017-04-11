class DropTableHellos < ActiveRecord::Migration
  def change
		drop_table :hellos
  end
end
