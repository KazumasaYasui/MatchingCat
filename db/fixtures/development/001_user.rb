2.times do |i|
  User.seed_once(:id) do |user|
    user.id = i + 1
    user.nickname = "管理者#{ i + 1 }番さん"
    user.email = "#{ i + 1 }@email.com"
    user.admin = true
    user.password = 111111 + i
    user.password_confirmation = 111111 +i 
  end
end