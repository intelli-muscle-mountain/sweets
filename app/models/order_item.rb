class OrderItem < ApplicationRecord
	belongs_to item
	belongs_to order

validates :price, presence: true
validates :quantity, presence: true
validates :item_status, presence: true

end
