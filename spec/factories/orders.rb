FactoryBot.define do
  factory :order do
    order_name "テスト太郎"
    order_tel "080-1234-5678"
    order_birth "1992-12-07"
    order_sex 0
    order_postal_code "1234567"
    order_prefecture 12
    order_city "千代田区"
    order_address "１−７−１"
    order_occupation "公務員"
    order_income 400
    order_residence "一戸建て"
    order_description "ネコが大好きです。"
    user
    cat
  end

end