FactoryBot.define do
  factory :answer_word1, class: AnswerWord do
    candidate { 'しっくりくる言葉候補1' }
    best_answer_flg { true }
    answer { nil }
  end

  factory :answer_word2, class: AnswerWord do
    candidate { 'しっくりくる言葉候補2' }
    answer { nil }
  end
end