class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :cats
  has_many :articles
  has_many :events
  has_many :posts, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :reservations, dependent: :destroy
end
