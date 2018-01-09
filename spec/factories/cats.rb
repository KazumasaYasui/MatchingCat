FactoryBot.define do
  factory :cat do
    cat_name "タマ"
    cat_age 0
    cat_sex "male"
    cat_breed "abyssinian"
    cat_prefecture "hokkaido"
    cat_description "かわいいネコです。"
    user
  end
end