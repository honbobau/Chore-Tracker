class AddTimeStampAndRatingsToChores < ActiveRecord::Migration
  def change
    change_table(:chores) do |t|
      t.integer "rating"
      t.timestamp
    end
  end
end
