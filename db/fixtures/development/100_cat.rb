50.times do |i|
  Cat.seed_once(:id) do |cat|
    cat.id = i + 1
    cat.user_id = rand(1..2)
    cat.cat_name = "#{ i + 1 }番目の保護猫"
    cat.cat_age = rand(0..12)
    cat.cat_sex = rand(0..1)
    cat.cat_breed = rand(0..25)
    cat.cat_prefecture = rand(0..46)
    cat.cat_description = "#{ i + 1 }番目の保護猫です。"
  end
end