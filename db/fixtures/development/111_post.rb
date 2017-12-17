50.times do |i|
  Post.seed_once(:id) do |post|
    post.id = i + 1
    post.user_id = rand(3..5)
    post.post_title = "#{ i + 1 }番目のつぶやき"
    post.post_body = "#{ i + 1 }番目のつぶやきです。"
  end
end