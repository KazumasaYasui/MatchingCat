2.times do |i|
  User.seed_once(:id) do |user|
    user.id = i + 1
    user.nickname = "管理者#{ i + 1 }番"
    user.email = "#{ i + 1 }@email.com"
    user.admin = true
    user.password = 111111 + i
    user.password_confirmation = 111111 + i
  end
end

3.times do |i|
  User.seed_once(:id) do |user|
    user.id = i + 3
    user.nickname = "ユーザー#{ i + 1 }番"
    user.email = "#{ i + 3 }@email.com"
    user.admin = false
    user.password = 111113 + i
    user.password_confirmation = 111113 + i
  end
end