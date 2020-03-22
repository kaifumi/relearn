# テストデータの準備
FactoryBot.define do
  factory :post do
    id { 1 }
    user_id  { 1 }
    genre_id { 1 }
    title { '英単語50個' }
    content { '・カンタンな単語25個　・難しい単語25個' }
    link { 'https://atsueigo.com/vocabulary/' }
    relearn_count { '0' }
    relearn_complete { 'false' }
    total_point { '0' }
  end
end
