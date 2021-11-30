class Notification < ApplicationRecord
  belongs_to :staff, foreign_key: 'staff_id'

  validates :title, presence: true, length: { maximum: 30 }
  validates :body, presence: true
end
