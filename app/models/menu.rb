class Menu < ApplicationRecord
  validates :treatment_detail, presence: true, length: { maximum: 50 }
  validates :charge, presence: true
  validates :treatment_time, presence: true
end
