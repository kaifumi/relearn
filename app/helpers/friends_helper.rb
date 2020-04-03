module FriendsHelper
  # リクエストを送っていたらtrueを返すメソッド
  def send_request(user_id)
    # リクエスト送った人がいないならtrue
    if Friend.where(sender_id: current_user.id, recipient_id: user_id, send_request: true).empty?
      false
    else
      true
    end
  end
end
