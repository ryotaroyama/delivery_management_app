class Product < ApplicationRecord
  has_many :orders, dependent: :destroy
  validates :name, presence: true, uniqueness: true, length: { maximum: 20 }
  validates :drawing_number, length: { maximum: 20 }

  enum process: {
    painting: 1,
    polishing: 2,
    processing: 3,
    alumite: 4,
    others: 5,
  }
end
