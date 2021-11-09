class Sale < ApplicationRecord
  has_one :property, as: :propertiable
end
