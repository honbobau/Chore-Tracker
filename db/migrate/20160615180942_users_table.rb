class UsersTable < ActiveRecord::Migration
  def change 
    create_table :users |t|
      t.string :user_name
      t.string :real_name
      t.string :password
      t.boolean :is_admin, default: false
      t.references :group
    end
  end
end
