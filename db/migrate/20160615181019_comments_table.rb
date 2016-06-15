class CommentsTable < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string "content"
      t.references "chore"
    end
  end
end
