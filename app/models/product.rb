class Product < ApplicationRecord
  has_many :orders, dependent: :destroy
  validates :name, presence: true, uniqueness: true, length: { maximum: 20 }
  validates :drawing_number, length: { maximum: 20 }

end
