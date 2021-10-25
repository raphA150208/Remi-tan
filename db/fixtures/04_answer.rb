Answer.seed do |s|
  s.id = 1
  s.comment = '自信ありません'
  s.user_id = 5
  s.question_id = 1
end
Answer.seed do |s|
  s.id = 2
  s.comment = '自信あります'
  s.user_id = 5
  s.question_id = 2
end
Answer.seed do |s|
  s.id = 3
  s.comment = 'ヒントが少なすぎます'
  s.user_id = 5
  s.question_id = 3
end
Answer.seed do |s|
  s.id = 4
  s.comment = 'いかがでしょうか'
  s.user_id = 4
  s.question_id = 1
end
Answer.seed do |s|
  s.id = 5
  s.comment = '日常会話で使いそうな言葉ですか？'
  s.user_id = 4
  s.question_id = 2
end