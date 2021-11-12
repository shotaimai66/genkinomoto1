class Item < ApplicationRecord
  # A user has only one cart. User > Cart > Orders (join table) > Items
  has_many :orders
  validates :name, presence: true, length: { maximum: 300 }
  
  # 商品画像をアップロードする
  mount_uploader :image, ImageUploader
end
