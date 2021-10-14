class Answer < ApplicationRecord
  belongs_to :question
  validates :comment, presence: true
  belongs_to :user
  has_many :answer_words
end
