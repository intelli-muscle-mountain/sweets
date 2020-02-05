class Order < ApplicationRecord
	has_many order_item, dependent: :destroy
	belong_to customer

	validates :payment, presence: true
	validates :freight, presence: true
	validates :order_status, presence: true
	validates :total_price, presence: true
end
