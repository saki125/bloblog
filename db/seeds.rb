first_user = User.new(nickname: "アナログ太郎", email: "test1@test.com", password: "1111aaaa", password_confirmation: "1111aaaa", introduction: "アナログ太郎です！")
first_user.image.attach(io: File.open("./app/assets/images/test_icon.png"), filename: 'test_icon.png')
first_user.save!
second_user = User.new(nickname: "デジタル太郎", email: "test2@test.com", password: "1111aaaa", password_confirmation: "1111aaaa", introduction: "デジタル太郎です！")
second_user.image.attach(io: File.open("./app/assets/images/test_icon.png"), filename: 'test_icon.png')
second_user.save!

post_1 = Post.new(title: "ダミーデータです", text: "```ruby\n変数について\n```", user_id: first_user.id)
post_1.image.attach(io: File.open("./app/assets/images/test_icon.png"), filename: 'test_icon.png')
post_1.save!

post_2 = Post.new(title: "テストです", text: "```ruby\nメソッドについて\n```", user_id: first_user.id)
post_2.image.attach(io: File.open("./app/assets/images/test_icon.png"), filename: 'test_icon.png')
post_2.save!

post_3 = Post.new(title: "検証です", text: "```ruby\nseed.rbファイルの確認\n```", user_id: second_user.id)
post_3.image.attach(io: File.open("./app/assets/images/test_icon.png"), filename: 'test_icon.png')
post_3.save!

post_4 = Post.new(title: "地上波です", text: "2011年7月11日", user_id: second_user.id)
post_4.image.attach(io: File.open("./app/assets/images/test_icon.png"), filename: 'test_icon.png')
post_4.save!

post_5 = Post.new(title: "ページネーション", text: "Rails奥深い", user_id: second_user.id)
post_5.image.attach(io: File.open("./app/assets/images/test_icon.png"), filename: 'test_icon.png')
post_5.save!
