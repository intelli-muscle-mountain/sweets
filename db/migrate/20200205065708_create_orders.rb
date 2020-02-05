class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :payment
      t.integer :freight
      t.integer :order_status
      t.integer :total_price

      t.timestamps
    end
  end
end
