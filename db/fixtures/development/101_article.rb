50.times do |i|
  Article.seed_once(:id) do |article|
    article.id = i + 1
    article.user_id = rand(1..2)
    article.article_title = "#{ i + 1 }番目の記事"
    article.article_body = "#{ i + 1 }番目の記事です。ねこに関する旬な情報をお届けします。"
  end
end

Article.seed do |article|
  article.id = 51
  article.user_id = rand(1..2)
  article.article_title = "管理人が選ぶ 2018年版 人気のねこランキング"
  article.article_body = "第1位：アビシニアン\n第2位：ソマリ\n第3位：ベンガル\n第4位：ロシアンブルー\n第5位：アメリカンショートヘア\n第6位：マンチカン\n第7位：ノルウェージャンフォレストキャット\n第8位：メインクーン\n第9位：ラグドール\n第10位：サイベリアン\n第11位：シャルトリュー\n第12位：スコティッシュフォールド\n第13位：ヒマラヤン\n第14位：シンガプーラ\n第15位：ブリティッシュショートヘア\n"
end