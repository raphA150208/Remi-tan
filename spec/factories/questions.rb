FactoryBot.define do
  factory :question1, class: Question do
    content { '質問内容1' }
    sentence { '実際に使う文章1' }
    user { nil }
  end

  factory :question2, class: Question do
    content { '質問内容2' }
    sentence { '実際に使う文章2' }
    user { nil }
    status { '解決済' }
  end
end