class Event < ApplicationRecord
  # CarrierWave 画像をURL経由で表示させる Event.image.url で表示可能
  mount_uploader :image, ImageUploader
end
