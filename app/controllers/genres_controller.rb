class GenresController < ApplicationController
  # ログインユーザーのみ実行可能にする
  before_action :authenticate_user!

  # 新規登録ジャンルの保存
  def create
    @genre = Genre.new(genre_params)
    @genre.user_id = current_user.id
    if @genre.save
      flash[:notice] = 'ジャンルの追加に成功しました'
    else
      flash[:alert] = 'ジャンルの追加に失敗しました'
    end
    redirect_to request.referer
  end

  # ジャンル追加編集画面の表示
  def index
    @genre = Genre.new
    @genres = Genre.where(user_id: current_user.id)
  end

  # 編集内容の更新
  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      flash[:notice] = 'ジャンルの更新に成功しました'
    else
      flash[:alert] = 'ジャンルの更新に失敗しました'
    end
    redirect_to request.referer
  end

  # ジャンルの削除
  def destroy
    @genre = Genre.find(params[:id])
    if @genre.destroy
      flash[:notice] = 'ジャンルの削除に成功しました'
    else
      flash[:alert] = 'ジャンルの削除に失敗しました'
    end
    redirect_to request.referer
  end

  private

  def genre_params
    params.require(:genre).permit(:type)
  end
end
