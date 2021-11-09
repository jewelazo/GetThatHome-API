class Property < ApplicationRecord
  belongs_to :user

  belongs_to :propertiable, polymorphic: true
end
