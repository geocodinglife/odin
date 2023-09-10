class Product < ApplicationRecord
  belongs_to :user
  has_many :category_products
  has_many :categories, through: :category_products
  has_many :leads
  has_rich_text :description
  has_many_attached :images
end
