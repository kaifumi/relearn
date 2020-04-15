module NotificationsHelper
  # 通知の種類の振り分けメソッド
  def notification_form(notification)
    # notification.actionがrequestかapproveかplan_timingか
    case notification.action
    when 'request'
      tag.a(notification.visitor.name, href: friend_receive_path(current_user.id), style: 'font-weight: bold;') + 'さんがあなたに友達リクエストを送りました'
      # 承認していたら連絡。拒否されたら表示しない。
    when 'approve'
      tag.a(notification.visitor.name, href: user_friends_path(current_user.id), style: 'font-weight: bold;') + 'さんがあなたの友達リクエストを承認しました'
    when 'plan_timing'
      tag.a(notification.plan_timing.post.title, href: user_post_path(user_id: current_user.id, id: notification.plan_timing.post_id), style: 'font-weight: bold;') + 'の' +
        tag.a(notification.term_num, href: user_post_path(user_id: current_user.id, id: notification.plan_timing.post_id), style: 'font-weight: bold;') + '回目の復習タイミングになりました'
    end
  end
end
