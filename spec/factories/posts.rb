FactoryBot.define do
  factory :post do
    title {"テストですよ"}
    text {"ここはテキストを入力するんですよ"}

    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end