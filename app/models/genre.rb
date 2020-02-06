class Genre < ApplicationRecord
	has_many :items, dependent: :destroy

validates :genre_name, presence: true
validates :genre_status, presence: true
end
