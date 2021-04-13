class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :processor
  belongs_to :product

  validates :delivery_date, presence: true
  validates :process, presence: true
  validates :drawing_number, length: { maximum: 20 }
  validates :comment, length: { maximum: 50 }
end
