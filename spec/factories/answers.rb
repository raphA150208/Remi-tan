FactoryBot.define do
  factory :answer1, class: Answer do
    comment { 'コメント1' }
    user { nil }
    question { nil }
  end

  factory :answer2, class: Answer do
    comment { 'コメント2' }
    user { nil }
    question { nil }
  end
end
