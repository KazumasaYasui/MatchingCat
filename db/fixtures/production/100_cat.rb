200.times do |i|
  Cat.seed_once(:id) do |cat|
    cat.id = i + 1
    cat.user_id = rand(1..2)
    cat.cat_name = "#{ i + 1 }番目の保護ねこ"
    cat.cat_age = rand(0..12)
    cat.cat_sex = rand(0..1)
    cat.cat_breed = rand(0..34)
    cat.cat_prefecture = rand(0..46)
    cat.cat_description = "#{ i + 1 }番目の保護ねこです。\n可愛くて人懐っこい性格です。\nワクチン接種済・健康診断済です。"
  end
end

Cat.seed do |cat|
  cat.id = 201
  cat.user_id = rand(1..2)
  cat.cat_name = "にゃん太郎"
  cat.cat_age = rand(0..12)
  cat.cat_sex = rand(0..1)
  cat.cat_breed = rand(0..34)
  cat.cat_prefecture = rand(0..46)
  cat.cat_description = "にゃん太郎です。\n少しやんちゃな性格ですが、愛くるしい表情や仕草も見せます。\n食欲が旺盛ですのでご注意ください。\nワクチン接種済・健康診断済です。"
end