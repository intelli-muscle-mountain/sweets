class Order < ApplicationRecord

	has_many :order_items, dependent: :destroy
	belongs_to :customer

	validates :payment, presence: true
	validates :freight, presence: true
	validates :order_status, presence: true
	validates :total_price, presence: true

	enum order_status: {入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4}

	def freight
		freight = 800
	end

	def total_quantity
		order_items.sum("quantity")
	end

	def sub_price
		order_items.sum("price * quantity")
	end
end


# def total_quantity
# 		quantity = 0
# 		order_items.each do |i|
# 			quantity += i.quantity
# 		end
# 		return quantitys
# 	end
