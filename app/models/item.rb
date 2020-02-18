class Item < ApplicationRecord
	has_many :cartitems, dependent: :destroy
	has_many :order_items

	belongs_to :genre

	attachment :image

	validates :name, presence: true
	validates :description, presence: true
	validates :price, presence: true
	def tax_included_price
		tax_included_price = price * 1.1
		tax_included_price = tax_included_price.round(0)
	end
end
