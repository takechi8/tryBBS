class ChangeComments < ActiveRecord::Migration
  def change
    change_table :comments do |t|
      t.remove :img_file_size, :img_updated_at
    end
  end
end
