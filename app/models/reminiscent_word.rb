class ReminiscentWord < ApplicationRecord
  belongs_to :question
  validates :keyword, presence: true, length: { maximum: 50 }
end
