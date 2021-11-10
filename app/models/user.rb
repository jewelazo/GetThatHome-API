VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { seeker: 0, landlord: 1 }

  # Associations
  has_many :properties, dependent: :destroy
  has_many :favorites, dependent: :destroy

  # Validations
  validates :name, :email, :role, presence: true
  validates :name, :email, :phone, uniqueness: true
  validates :email, format: { with: VALID_EMAIL_REGEX }, allow_blank: false
end
