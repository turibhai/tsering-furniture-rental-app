class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :furniture
  validates :start_date, presence: true
  validates :end_date, presence: true
  has_one_attached :photo
  enum status: { pending: 0, approved: 1, rejected: 2, cancelled: 3 }
end

# def pending?
#   status == 'pending'
# end
