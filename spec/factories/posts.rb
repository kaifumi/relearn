# テストデータの準備
FactoryBot.define do
  factory :post do
    user_id  { 5 }
    genre_id { 5 }
    title { '英単語50個' }
    content { '・カンタンな単語25個　・難しい単語25個' }
    link { 'https://atsueigo.com/vocabulary/' }
    relearn_count { '0' }
    relearn_complete { 'false' }
    total_point { '0' }
    # created_at  { "TEST01" }
    # updated_at  { "TEST01" }
  end
end
