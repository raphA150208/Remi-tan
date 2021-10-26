class ReminiscentWordsDictionary < ApplicationRecord
  validates :answer_word, presence: true, length: { maximum:50 }
  validates :reminiscent_word, presence: true, length: { maximum:50 }
  belongs_to :question
end
