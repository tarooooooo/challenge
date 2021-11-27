class CreatePayPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :pay_posts do |t|
      t.references :post, foreign_key: true
      t.string :price, null: false

      t.timestamps
    end
  end
end
