class Answer < ApplicationRecord
  validates :comment, length: { maximum: 1000 }
  belongs_to :question
  validates :comment, presence: true
  belongs_to :user
  has_many :answer_words, dependent: :destroy
  accepts_nested_attributes_for :answer_words, reject_if: :all_blank, allow_destroy: true
end
