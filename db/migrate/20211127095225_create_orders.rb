class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :buyer_id, null: false
      t.integer :seller_id, null: false
      t.integer :post_id, null: false
      t.string :order_price, null: false

      t.timestamps
    end
  end
end
