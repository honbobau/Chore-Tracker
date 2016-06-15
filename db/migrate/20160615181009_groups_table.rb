class GroupsTable < ActiveRecord::Migration
  def change
    create_table :groups |t|
      t.string :group_name
    end
  end
end
