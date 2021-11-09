class Rent < ApplicationRecord
  has_one :property, as: :propertiable
end
