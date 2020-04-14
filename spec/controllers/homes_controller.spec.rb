Rspec.describe homesController, type: :controller do
  # userをcreateし、let内に格納
  let(:user) { create(:user) }

  describe 'GET #about' do
    before do
      # controller_macros.rb内のlogin_userメソッドを呼び出し
      login_user user
    end

    it 'renders the :about template' do
    end
  end
end
