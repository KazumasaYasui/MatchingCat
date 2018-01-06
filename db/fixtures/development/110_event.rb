50.times do |i|
  Event.seed_once(:id) do |event|
    event.id = i + 1
    event.user_id = rand(1..2)
    event.event_title = "#{ i + 1 }番目のイベント"
    event.event_body = "#{ i + 1 }番目のイベントです。"
    event.event_datetime = "2017-12-24 12:00:00"
    event.event_address = "東京都渋谷区神南１−１９−１１"
    event.event_people = 11
    event.event_remark = "参加費無料です。\n所要時間は2時間を予定しています。\n保護ねことのふれあいをお楽しみ下さい。"
    event.latitude = 35.662822
    event.longitude = 139.699475
  end
end

Event.seed do |event|
  event.id = 51
  event.user_id = rand(1..2)
  event.event_title = "保護ねこふれあい体験会"
  event.event_body = "MatchingCatが主催する保護ねこ体験会です。\n里親募集中の保護ねこが10匹ほど参加しますので、ぜひこの機会に保護ねことのふれあいをお楽しみください。（里親になるためには審査がございます。）\nイベントへの参加には予約が必須ですので、応募フォームよりご予約ください。\n所要時間は2時間を予定しています。"
  event.event_datetime = "2018-01-08 15:00:00"
  event.event_address = "東京都渋谷区神南１−１９−１１"
  event.event_people = 11
  event.event_remark = "参加費無料・持ち物不要です。\n注：里親を希望される方は、顔写真付きの身分証明書（運転免許証・マイナンバーカード）、印鑑（シャチハタ可）をお持ちの上、面接ブースにお越しください。"
  event.latitude = 35.662822
  event.longitude = 139.699475
end