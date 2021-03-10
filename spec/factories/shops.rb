FactoryBot.define do
  factory :shop do
    association :user
    shop_name             {'テスト'}
    bland                 {'GUCCI'}
    shop_detail           {'実店舗はありません'}
    
    after(:build) do |shop|
      shop.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
