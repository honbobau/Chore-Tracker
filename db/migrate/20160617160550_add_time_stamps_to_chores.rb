class AddTimeStampsToChores < ActiveRecord::Migration
  def change
    change_table(:chores) do |t|
      t.timestamps
    end
  end
end
