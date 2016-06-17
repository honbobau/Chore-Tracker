class AddTimeCompletedAt < ActiveRecord::Migration
  def change
    change_table(:chores) do |t|
      t.datetime "completed_at"
    end
  end
end

