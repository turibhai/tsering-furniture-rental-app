class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :furniture
  validates :start_date, presence: true
  validates :end_date, presence: true
  enum status: { pending: 0, approved: 1, rejected: 2, cancelled: 3 }
end
