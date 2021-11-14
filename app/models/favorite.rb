class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :property

  validates :favorite, presence: true
end
