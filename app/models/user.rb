class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }
  has_many :questions
  has_many :answers
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
