FactoryBot.define do
  factory :purchase_record_shipping_record do
    postal_code    { '123-4567' }
    prefecture_id  { 14 }
    city           { '東京都' }
    house_number   { '渋谷区山田町1-1' }
    building_name  { 'ABCマンション301' }
    phone_number   { '08012345678' }
  end
end