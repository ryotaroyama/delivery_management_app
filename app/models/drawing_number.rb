class DrawingNumber < ApplicationRecord
  belongs_to :product
  validates :name, uniqueness: true, length: { maximum: 20 }
end
