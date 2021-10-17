class Answer < ApplicationRecord
  validates :comment, length: { maximum: 1000 }
  belongs_to :question
  validates :comment, presence: true
  belongs_to :user
  has_many :answer_words
  accepts_nested_attributes_for :answer_words, allow_destroy: true
end
