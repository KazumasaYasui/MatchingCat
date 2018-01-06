FactoryBot.define do
  factory :user do
    nickname "テストボット"
    email "#test@email.com"
    admin true
    password 111111
    password_confirmation 111111
    initialize_with { User.find_or_create_by(email: email)}
  end
end