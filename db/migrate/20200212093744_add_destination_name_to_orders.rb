class AddDestinationNameToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :destination_name, :string
  end
end
