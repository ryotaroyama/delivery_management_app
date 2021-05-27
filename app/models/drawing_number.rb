class DrawingNumber < ApplicationRecord
  has_many :orders, dependent: :destroy
  validates :name, uniqueness: true, presence: true, length: { maximum: 20 }
end
