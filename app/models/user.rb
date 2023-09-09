class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  
  has_many :role_users
  has_many :roles, through: :role_users

 

  def has_role?(role_name)
    roles.exist?(name: role_name)
  end
end
