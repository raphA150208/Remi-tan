class AnswerWord < ApplicationRecord
  belongs_to :answer
  validates :candidate, length: { maximum: 50 }
end
