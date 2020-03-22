require 'rails_helper'
# 一番外側のdescribe以外はRSpec.を省略できる
RSpec.describe PostsController, type: :request do
  # テストグループ ( クラス名, メソッド名, ) を記載
  describe 'ログイン済みの新規投稿のテスト' do
    before do
      # テストデータをFactroyBotで作成
      user = FactoryBot.create :user
      sign_in user
    end
    # テスト条件 ( 変数の違いや前提条件の違い ) を記載
    context '新規投稿ページがちゃんと表示されるかテスト' do
      # テスト対象 = expectの引数になるものを記載
      subject { get '/posts/new' }
      # テスト結果を記載
      it 'リクエストが成功すること' do
        # ここでsubjectを書くことで「get :new」を意味している
        subject
        expect(response.status).to eq 200
      end

      # controllerではレスポンスボディの結果がexpected "" が出てしまう
      # request spec を使うことで可能になった
      it 'レスポンスボディに 新規投稿 が含まれていること' do
        subject
        expect(response.body).to include('新規投稿')
      end
    end

    context '新規投稿ページがちゃんと表示されるかテスト' do
      # テスト対象 = expectの引数になるものを記載
      subject { post.create(title, content) }
      subject(:post) { Post.new(email: 'hoge@example.com', password: 'password') }

      it '投稿後にレコードが一つ増えているかテスト' do
        expect { subject }.to change(Post, :count).by(1)
      end
    end
  end
end
