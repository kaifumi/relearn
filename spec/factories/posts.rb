require 'faker'
# テストデータの準備
FactoryBot.define do
  factory :post do
    id { 1 }
    user_id  { 1 }
    genre_id { 1 }
    title { Faker::Movies::StarWars }
    content { Faker::Quote }
    link { Faker::Internet.url }
    relearn_count { '0' }
    relearn_complete { 'false' }
    total_point { '0' }
  end
end
