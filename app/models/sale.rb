class Sale < ApplicationRecord
  has_one :property, as: :propertiable, dependent: :destroy

  # Validation
  validates :price, numericality: { greater_than: 0 }
end
