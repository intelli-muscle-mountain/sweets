class Address < ApplicationRecord
	belong_to customer

validates :destination_name, presence: true
validates :postal_code, presence: true
validates :address, presence: true
end
