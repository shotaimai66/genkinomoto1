class Menu < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  validates :charge, presence: true
  validates :treatment_time, presence: true
  validates :course_number, presence: true, uniqueness: true
end
