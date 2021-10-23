FactoryBot.define do
  factory :user1, class: User do
    name { 'user1' }
    email { 'user1@example.com' }
    password { 'password' }
    password_confirmation { 'password' }
    admin { false }
  end

  factory :user2, class: User do
    name { 'user2' }
    email { 'user2@example.com' }
    password { 'password' }
    password_confirmation { 'password' }
    admin { false }
  end
end