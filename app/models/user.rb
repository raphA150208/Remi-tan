class User < ApplicationRecord
  validates :name, presence: true, length: { maximum:20 }
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  def self.guest
    find_or_create_by!(name: 'ゲスト', email: 'guest@example.com') do |user|
      user.password = SecureRandom.alphanumeric()
    end
  end
  def self.admin_guest
    find_or_create_by!(name: '管理者ゲスト', email: 'admin_guest@example.com', admin: true) do |user|
      user.password = SecureRandom.alphanumeric()
    end
  end
end
