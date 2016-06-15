class ChoresTable < ActiveRecord::Migration
  def change
    create_table :chores do |t|
      t.string "name"
      t.string "description"
      t.integer "difficulty"
      t.boolean "completed", default: false
      t.references "user"
      t.references "group"
      t.timestamp
    end
  end
end
