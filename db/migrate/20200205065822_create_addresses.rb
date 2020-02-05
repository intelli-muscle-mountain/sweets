class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :customer_id
      t.string :destination_name
      t.string :postal_code
      t.text :address

      t.timestamps
    end
  end
end
