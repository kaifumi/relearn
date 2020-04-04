module FriendsHelper
  # リクエストの送受信状況の確認メソッド
  def send_request(user_id)
    sender = Friend.where(sender_id: current_user.id, recipient_id: user_id, send_request: true)
    # RecordNotUniqueに対応するため、対象のユーザーが自分にリクエストを送っていないか確認する
    recipient = Friend.where(sender_id: user_id, recipient_id: current_user.id, send_request: true)
    # リクエスト送ってないならtrue
    if sender.empty? && recipient.empty?
      0 # 0は未送信かつ未受信とする
    elsif sender.empty? && recipient.present? && recipient[0].active_status == false
      1 # 1は未送信かつ受信済とする
    elsif sender.present? && recipient.empty? && sender[0].active_status == false
      2 # 2はリクエスト送信済
    else
      3 # 3は自分or相手がリクエスト送信後承認済み
    end
  end
end
