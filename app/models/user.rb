class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }
  has_many :questions
  has_many :answers
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  def self.guest
    find_or_create_by!(name: 'ゲスト', email: 'guest@email.com') do |user|
      user.password = SecureRandom.alphanumeric()
    end
  end
  def self.admin_guest
    find_or_create_by!(name: '管理者ゲスト', email: 'admin_guest@example.com', admin: true) do |user|
      user.password = SecureRandom.alphanumeric()
    end
  end
end
