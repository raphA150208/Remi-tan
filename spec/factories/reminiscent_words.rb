FactoryBot.define do
  factory :reminiscent_word1, class: ReminiscentWord do
    keyword { '連想ワード1' }
    question_id { 1 }
  end
  factory :reminiscent_word2, class: ReminiscentWord do
    keyword { '連想ワード2' }
    question_id { 2 }
  end
  factory :reminiscent_word3, class: ReminiscentWord do
    keyword { '連想ワード3' }
    question_id { 3 }
  end
end