FactoryBot.define do
  factory :user do
    nickname {"テス太郎"}
    email {Faker::Internet.free_email}
    password  {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    introduction {"自己紹介を記述するところだよ"}
  end
end