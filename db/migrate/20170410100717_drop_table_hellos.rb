class DropTableHello < ActiveRecord::Migration
  def change
		drop_table :hellos
  end
end
