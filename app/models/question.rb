class Question < ApplicationRecord
  # validates :content, presence: true, length: { maximun: 1000 }
  has_many :answers, dependent: :destroy
  belongs_to :user
  has_many :reminiscent_words, dependent: :destroy
  accepts_nested_attributes_for :reminiscent_words, allow_destroy: true, reject_if: :all_blank
  enum status: {回答受付中:0, 解決済:1}
  scope :search_status, -> (status) { where(status: status)}
end
