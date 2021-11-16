class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :nickname, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :remember_token
      t.boolean :deleted, null: false, default: false
      t.text :introduction, null: false
      t.string :icon_image_id

      t.timestamps
    end
  end
end
