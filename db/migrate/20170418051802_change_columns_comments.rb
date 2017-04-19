class ChangeColumnsComments < ActiveRecord::Migration

  def change
    change_table :comments do |t|
      t.change :public_start_date, :datetime
      t.change :public_end_date, :datetime
    end
  end

end
