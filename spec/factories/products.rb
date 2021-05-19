FactoryBot.define do
  factory :product do
    name                    {'洋服'}
    introduction            {'ユニクロで購入しました。未使用品です。'}
    category_id             {'3'}
    condition_id            {'2'}
    postage_id              {'3'}
    prefecture_id           {'14'}
    day_id                  {'2'}
    price                   {'1000'}
    association :user

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/uniqlo_image.png'), filename: 'uniqlo_image.png')
    end
  end
end