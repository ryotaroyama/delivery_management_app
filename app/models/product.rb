class Product < ApplicationRecord
  belongs_to :customer
  belongs_to :processor

  validates :name, presence: true, length: { maximum: 20 }
  validates :process, presence: true
  validates :delivery_date, presence: true
  validates :drawing_number, uniqueness: true, length: { maximum: 20 }
  validates :comment, length: { maximum: 50 }

  enum process: {
    painting: 1,
    polishing: 2,
    processing: 3,
    alumite: 4,
    others: 5,
  }
end
