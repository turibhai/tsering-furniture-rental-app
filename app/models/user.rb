class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :furnitures
  has_many :rentals
  has_many :rentals_as_owner, through: :furnitures, source: :rentals
  has_many :reviews, dependent: :destroy
  has_one_attached :photo
end
