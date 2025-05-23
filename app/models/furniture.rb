class Furniture < ApplicationRecord
  belongs_to :user
  has_many :rentals
  validates :name, presence: true
  CATEGORIES = ["Lamp", "Garden", "Matress", "Tv Table", "Mirror", "Wardrove"] #added new list of category to pass validity for api
  validates :furniture_type, presence: true, inclusion: { in: CATEGORIES }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  has_one_attached :photo
  has_many :reviews, dependent: :destroy

  paginates_per 10
  include PgSearch::Model
  pg_search_scope :search,
    against: [ :name, :furniture_type, :description ],
    using: {
      tsearch: { prefix: true }
  }
end
