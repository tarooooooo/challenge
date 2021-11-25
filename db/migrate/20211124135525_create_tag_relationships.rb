class CreateTagRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_relationships do |t|
      t.references :user, foreign_key: true, null: false
      t.references :tag, foreign_key: true, null: false

      t.timestamps
    end
    add_index :tag_relationships, [:user_id, :tag_id], unique: true
  end
end
