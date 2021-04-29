class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :processor
  belongs_to :product
  belongs_to :drawing_number, optional: true

  validates :delivery_date, presence: true
  validates :process, presence: true
  validates :comment, length: { maximum: 10000 }

  enum process: {
    painting: 1,
    polishing: 2,
    processing: 3,
    alumite: 4,
    others: 5,
  }
end
