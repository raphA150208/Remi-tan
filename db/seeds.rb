User.create!(name: "naruto", email: "naruto@sample.com", password: "naruto", password_confirmation: "naruto", admin: true)

5.times do |n|name = Faker::JapaneseMedia::Naruto.character
  email = Faker::Internet.email
  password = "password"
  password_confirmation = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password_confirmation,
               admin: false
              )
end

5.times do |n|
  user_id = n + 1
  Question.create!(
    content: "質問内容#{n + 1}",
    sentence: "実際に使う文章#{n + 1}",
    status: 0,
    user_id: user_id
  )
end

5.times do |n|
  question_id = n + 1
  ReminiscentWord.create!(
  keyword: "連想ワード#{n + 1}",
  question_id: question_id
  )
end

5.times do |n|
  user_id = n + 1
  question_id = n + 1
  Answer.create!(
    comment: "コメント#{n + 1}",
    user_id: user_id,
    question_id: question_id
  )
end

5.times do |n|
  answer_id = n + 1
  AnswerWord.create!(
    candidate: "しっくりくる言葉候補#{n + 1}",
    best_answer_flg: false,
    answer_id: answer_id
  )
end

ReminiscentWordsDictionary.seed do |s|
    s.id = 1
    s.answer_word = "しっくりくる言葉A"
    s.best_answer_flg = true
    s.reminiscent_word = "連想ワード6"
end

ReminiscentWordsDictionary.seed do |s|
    s.id = 2
    s.answer_word = "しっくりくる言葉A"
    s.best_answer_flg = true
    s.reminiscent_word = "連想ワード7"
end

ReminiscentWordsDictionary.seed do |s|
    s.id = 3
    s.answer_word = "しっくりくる言葉A"
    s.best_answer_flg = true
    s.reminiscent_word = "連想ワード8"
end

ReminiscentWordsDictionary.seed do |s|
    s.id = 4
    s.answer_word = "しっくりくる言葉B"
    s.best_answer_flg = false
    s.reminiscent_word = "連想ワード6"
end

ReminiscentWordsDictionary.seed do |s|
    s.id = 5
    s.answer_word = "しっくりくる言葉B"
    s.best_answer_flg = false
    s.reminiscent_word = "連想ワード7"
end
ReminiscentWordsDictionary.seed do |s|
    s.id = 6
    s.answer_word = "しっくりくる言葉B"
    s.best_answer_flg = false
    s.reminiscent_word = "連想ワード8"
end
ReminiscentWordsDictionary.seed do |s|
    s.id = 7
    s.answer_word = "しっくりくる言葉C"
    s.best_answer_flg = false
    s.reminiscent_word = "連想ワード6"
end
ReminiscentWordsDictionary.seed do |s|
    s.id = 8
    s.answer_word = "しっくりくる言葉C"
    s.best_answer_flg = false
    s.reminiscent_word = "連想ワード7"
end
ReminiscentWordsDictionary.seed do |s|
    s.id = 9
    s.answer_word = "しっくりくる言葉C"
    s.best_answer_flg = false
    s.reminiscent_word = "連想ワード8"
end






