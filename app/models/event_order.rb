class EventOrder < ApplicationRecord
  belongs_to :cart
  belongs_to :event
end
