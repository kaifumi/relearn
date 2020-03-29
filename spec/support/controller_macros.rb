# マクロ(macros) = ヘルパーメソッド
# ヘルパーメソッドを定義してrspec内のテストでもdeviseを使用できるようにする。
module ControllerMacros
  def login(user)
    @request.env['devise.mapping'] = Devise.mappings[:user]
    sign_in user
  end
end
