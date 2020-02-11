class Cartitem < ApplicationRecord
	belongs_to :customer
	belongs_to :item

	validates :quantity, presence: true

	def tax_included_price
		tax_included_price = price * 1.1
	end
	
end
