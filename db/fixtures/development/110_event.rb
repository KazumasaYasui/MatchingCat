50.times do |i|
  Event.seed_once(:id) do |event|
    event.id = i + 1
    event.user_id = rand(1..2)
    event.event_title = "#{ i + 1 }番目のイベント"
    event.event_body = "#{ i + 1 }番目のイベントです。"
    event.event_datetime = "2017-12-01 20:00:00"
    event.event_address = "東京都渋谷区神南１−１９−１１"
    event.event_people = 11
    event.event_remark = "参加費無料です"
    event.latitude = 35.662822
    event.longitude = 139.699475
  end
end