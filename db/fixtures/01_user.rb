4.times do |n|
  User.seed do |s|
    s.id = "#{n+1}"
    s.name = Faker::JapaneseMedia::Doraemon.character
    s.email = Faker::Internet.email
    s.password = "password"
    s.admin = false
  end
end
User.seed do |s|
  s.id = 5
  s.name = Faker::JapaneseMedia::Doraemon.character
  s.email = Faker::Internet.email
  s.password = "password"
  s.admin = true
end


