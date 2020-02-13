class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cartitems, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :addresses, dependent: :destroy


  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true

  def full_address
    '〒' + self.postal_code + ' ' + self.address
  end

  def full_name
    self.last_name + self.first_name
  end
  def active_for_authentication?
    super && customer_status?
  end
end
