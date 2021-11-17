class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.datetime :meeting_at, null: false
      t.integer :limit, default: 0, null: false
      t.references :genre, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
      t.boolean :deleted, default: false, null: false

      t.timestamps
    end
  end
end
