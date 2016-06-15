class CommentsTable < ActiveRecord::Migration
  def change
    create_table :comments |t|
      t.string :content
      t.references :chore
    end
  end
end
