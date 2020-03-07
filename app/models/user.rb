class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true, length: {maximum: 30, minimun: 3}
  validates :last_name, presence: true, length: {maximum: 30, minimun: 3}

  has_many :memories
  # has_many :photos 
end
