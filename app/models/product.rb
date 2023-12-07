class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :leads
  has_rich_text :descriptions
  has_many_attached :images
end
