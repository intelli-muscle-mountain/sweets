class Order < ApplicationRecord

	has_many :order_item, dependent: :destroy
	belongs_to :customer

	validates :payment, presence: true
	validates :freight, presence: true
	validates :order_status, presence: true
	validates :total_price, presence: true

	enum order_status: {入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4}
end
