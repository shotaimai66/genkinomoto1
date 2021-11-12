class Cart < ApplicationRecord
  # A user has only one cart. User > Cart > Orders (join table) > Items
  belongs_to :user
  # A cart has many orders.
  has_many :orders
  has_many :items, through: :orders # A cart has many items through orders.
  has_many :payments
end
