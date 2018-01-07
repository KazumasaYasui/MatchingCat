FactoryBot.define do
  factory :post do
    post_title "私のねこ"
    post_body "これが私の飼っているねこです。"
    user
  end
end