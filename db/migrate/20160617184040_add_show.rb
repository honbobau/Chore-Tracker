class AddShow < ActiveRecord::Migration
  def change
    change_table :chores do |t|
      t.boolean "show?", default: true
    end
  end
end
