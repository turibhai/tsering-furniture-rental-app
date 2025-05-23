class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :furniture
  validates :start_date, presence: true
  validates :end_date, presence: true
  has_one_attached :photo
  enum status: { pending: 0, approved: 1, rejected: 2, rental: 3 }
  scope :for_owner, ->(user) {
  joins(:furniture).where(furnitures: { user_id: user.id })
}
end

# def pending?
#   status == 'pending'
# end
