class OrderItem < ApplicationRecord
	belong_to :item
	belong_to :order

validates :price, presence: true
validates :quantity, presence: true
validates :item_status, presence: true

end
