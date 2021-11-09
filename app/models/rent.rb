class Rent < ApplicationRecord
  has_one :property, as: :propertiable, dependent: :destroy

  # Validation
  validates :pet, inclusion: [true, false]
  validates :maintenance, :monthly_rent, numericality: { greater_than: 0 }
end
