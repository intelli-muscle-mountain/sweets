class ChangeColumnToOrder < ActiveRecord::Migration[5.2]
  def change
  	change_column :orders, :order_status, :integer, default: 0, null: false
  	change_column :order_items, :item_status, :integer, default: 0, null: false
  end
end
