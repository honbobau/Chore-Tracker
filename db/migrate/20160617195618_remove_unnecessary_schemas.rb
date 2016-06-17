class RemoveUnnecessarySchemas < ActiveRecord::Migration
  def change
    change_table(:chores) do |t|
      t.remove :created_at
      t.remove :updated_at
    end

    change_table(:users) do |t|
      t.remove :is_admin
    end
  end
end
