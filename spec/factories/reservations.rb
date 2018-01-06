FactoryBot.define do
  factory :reservation do
    reservation_name "テスト太郎"
    reservation_tel "080-1234-5678"
    reservation_people 3
    user
    event
  end
end
