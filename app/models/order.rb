class Order < ApplicationRecord
  # This is a join table between Cart and Item.
  # A user has only one cart. User > Cart > Orders (join table) > Items
  belongs_to :cart
  belongs_to :item
end
