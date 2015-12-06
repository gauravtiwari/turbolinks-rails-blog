class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.string :slug, index: true
      t.integer :comments_count, index: true
      t.string :voter_ids, array: true, default: '{}'
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
