FactoryBot.define do
  factory :event do
    event_title "テストイベント"
    event_body "テストイベントです。"
    event_remark "参加費無料です。"
    event_datetime "2017-12-07 20:00:00"
    event_address "東京都渋谷区神南１−１９−１１"
    event_people 11
    user
  end
end