class Review < ApplicationRecord
  belongs_to :user
  belongs_to :furniture

  validates :title, :content, :rating, presence: true
  validates :rating, numericality: { only_integer: true, in: 1..5 }
end
