class Furniture < ApplicationRecord
  belongs_to :user
  has_many :rentals
  validates :name, presence: true
  CATEGORIES = ['chair', 'table', 'desk', 'sofa', "lamp", "garden", "matress", "tv table", "mirror", "wardrove"] #added new list of category to pass validity for api
  validates :furniture_type, presence: true, inclusion: { in: CATEGORIES }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  has_one_attached :photo
  paginates_per 20
end
