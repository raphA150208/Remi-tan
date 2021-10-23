FactoryBot.define do
  factory :reminiscent_words_dictionary1, class: ReminiscentWordsDictionary do
    answer_word { 'しっくりくる言葉1' }
    best_answer_flg { true }
    reminiscent_word { '連想ワード1' }
  end
  factory :reminiscent_words_dictionary2, class: ReminiscentWordsDictionary do
    answer_word { 'しっくりくる言葉2' }
    reminiscent_word { '連想ワード2' }
  end
end