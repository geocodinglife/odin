class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :leads
  has_many :rooms
  has_rich_text :description
  has_many_attached :images
end
