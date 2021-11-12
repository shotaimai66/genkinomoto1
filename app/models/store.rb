class Store < ApplicationRecord
  has_many :users
  has_many :staffs
end
