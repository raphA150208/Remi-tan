class AnswerWord < ApplicationRecord
  belongs_to :answer
  validates :candidate, presence: true, length: { maximum: 50 }
end
