50.times do |i|
  Article.seed_once(:id) do |article|
    article.id = i + 1
    article.user_id = rand(1..2)
    article.article_title = "#{ i + 1 }番目の記事"
    article.article_body = "#{ i + 1 }番目の記事です。"
  end
end