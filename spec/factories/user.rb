# # # テストデータの準備
# # FactoryBot.define do
# #   factory :user do
# #     id { 1 }
# #     name  { 'テストマン' }
# #     email { 'test@test' }
# #     password { 'aaaaaa' }
# #   end
# # end
# FactoryGirl.define do
#   pass = Faker::Internet.password(8)

#   factory :user do
#     name                  Faker::Name.name
#     email                 Faker::Internet.email
#     password              pass
#     password_confirmation pass
#     email_status          true
#     rank_status           false
#     search_status         false
#   end
# end

FactoryBot.define do
  factory :total_point do
    id { 1 }
    user_id { 1 }
    score { 2700 }
  end
end
