class Address < ApplicationRecord

	belongs_to :customer
	validates :destination_name, presence: true
	validates :postal_code, presence: true
	validates :address, presence: true

	def name_address
		"〒" + self.postal_code + " " + self.address + " " + self.destination_name
	end



end
