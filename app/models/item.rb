class Item < ApplicationRecord
	has_many :cartitems, dependent: :destroy
	has_many :order_items,
	belongs_to genre

	attachment :image

	validates :name, presence: true
	validates :description, presence: true
	validates :price, presence: true
	validates :sale_status, presence: true
end
