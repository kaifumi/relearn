Rspec.describe HomesController, type: :controller do
  # テストケース設計（①正しいビューに変遷するか。②インスタンス変数が期待された値を持つか。）

  describe 'GET #top' do
    it '正しいビューに遷移する' do
    end

    it '@total_pointが期待される値を持つ' do
    end

    it '@user_rateが期待される値を持つ' do
    end

    context '@user_rate.total_rate > 1 だった時' do
      it '@total_pointの値が1になる' do
      end
    end

    context '@user_rate.total_rate <= 1 だった時' do
      it '@total_pointの値が期待される値を持つ' do
      end
    end

    context '@user_rate.count >= 1 だったとき' do
      it '@average_rateのが期待される値を持つ' do
      end
    end

    context '@user_rate.count < 1 だったとき' do
      it '@average_rateが値を持たない' do
      end
    end

    it '@postsが期待される値を持つ' do
    end

    it '@order_postsが期待される値を持つ' do
    end

    it '@genresが期待される値を持つ' do
    end

    it '@postが期待される値を持つ' do
    end
  end

  describe 'GET #about' do
    it '正しいビューに遷移する' do
    end
  end
end
