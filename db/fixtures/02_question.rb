Question.seed do |s|
  s.id = 1
  s.content = '時間経過によって徐々に育まれる…そんなイメージの言葉を探してします。'
  s.sentence = 'まちに対する誇りを意味するシビックプライドの〇〇のため、2つの事業を開催します。'
  s.status = 1
  s.user_id = 1
end
Question.seed do |s|
  s.id = 2
  s.content = '記載した連想ワードは私のイメージに合致するものではありませんが、類似するものです。'
  s.sentence = 'わたしたち団体が日常的に直面する課題に対する解答がすでに提示されていたり、問題解決の糸口が〇〇されたりしています。'
  s.status = 1
  s.user_id = 2
end
Question.seed do |s|
  s.id = 3
  s.content = '連想ワードに記載したものはイメージに近いのですが、しっくりこないので力を貸していただけるとうれしいです。'
  s.sentence = '今から遡ること５０年前、１９７１年３月２７日に自らの住み暮らすまちを真剣に良くしようと「空も緑も美しい心豊かな町作りに青年の行動を結集しよう」の〇〇のもと当団体は創立されました。'
  s.status = 0
  s.user_id = 3
end
Question.seed do |s|
  s.id = 4
  s.content = '家族で会話をしていて気になったので質問しました。わかる方いたら教えて下さい。'
  s.sentence = ''
  s.status = 0
  s.user_id = 4
end
Question.seed do |s|
  s.id = 5
  s.content = '団体の委員会方針を書いているのですが、いい言葉が思い浮かばないので力を貸して下さい。'
  s.sentence = '当委員会は以上の研修を通じて大きく変化する時代の中、変化を敏感に捉えつつも〇〇されることなく'
  s.status = 0
  s.user_id = 5
end