# テストデータの準備
FactoryBot.define do
  factory :user do
    id { 1 }
    name  { 'テストマン' }
    email { 'test@test' }
    password { 'aaaaaa' }
  end
end
