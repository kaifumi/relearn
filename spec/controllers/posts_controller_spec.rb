require 'rails_helper'
RSpec.describe PostsController, type: :controller do
  describe '新規投稿ページ' do
    context '新規投稿ページが正しく表示される' do
      before do
        FactoryBot.create :post
      end

      it 'リクエストが成功すること' do
        get posts_url
        expect(response.status).to eq 200
      end

      it '@postが取得できていること' do
        get '/posts/1'
        expect(response.body).to include '単語'
      end
    end
  end
end
