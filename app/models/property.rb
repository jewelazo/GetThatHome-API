class Property < ApplicationRecord
  enum property_type: { appartment: 0, house: 1 }

  has_one_attached :photo
  belongs_to :user

  belongs_to :propertiable, polymorphic: true
  # Validations: address,type,bedrooms,bathrooms,area,description,photo,user,propertiable,favorites_count
  validates :address, :property_type, :description, :user, presence: true
  validates :bedrooms, :bathrooms, numericality: { greater_than_or_equal_to: 1 }
  validates :area, numericality: { greater_than: 0 }
end
