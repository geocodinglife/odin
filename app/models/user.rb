class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_roles
  has_many :roles, through: :user_roles
  has_many :products
  has_many :leads
  has_many :user_rooms
  has_many :rooms, through: :user_rooms
  has_many :messages
  
  validates_uniqueness_of :phone
end
