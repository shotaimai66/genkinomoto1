class Notification < ApplicationRecord
  belongs_to :staff

  validates :title, presence: true, length: { maximum: 30 }
  validates :body, presence: true
end
