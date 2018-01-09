100.times do |i|
  Post.seed_once(:id) do |post|
    post.id = i + 1
    post.user_id = rand(3..5)
    post.post_title = "#{ i + 1 }番目のつぶやき"
    post.post_body = "#{ i + 1 }番目のつぶやきです。\n私の飼っているねこです。\n愛くるしい表情や仕草に毎日癒やされています。"
  end
end

Post.seed do |post|
  post.id = 101
  post.user_id = rand(3..5)
  post.post_title = "我が家のねこ"
  post.post_body = "私の飼っているねこです。\n名前はジジ。\n魔女の宅急便から取りました。\n愛くるしい表情や仕草に毎日癒やされています。"
end