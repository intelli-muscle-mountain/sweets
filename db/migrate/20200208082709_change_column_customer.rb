class ChangeColumnCustomer < ActiveRecord::Migration[5.2]
  def change
  	change_column :customers, :customer_status, :boolean, default: true, null: false
  end
end
