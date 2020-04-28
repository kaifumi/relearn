class Users::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!

  protected

  # サインアップ後にユーザーごとのポイントと復習率のレコードを作成する
  def after_sign_up_path_for(_resource)
    TotalPoint.create!(user_id: current_user.id) if TotalPoint.find_by(user_id: current_user.id).nil?
    Rate.create!(user_id: current_user.id) if Rate.find_by(user_id: current_user.id).nil?
    root_path
  end
end
