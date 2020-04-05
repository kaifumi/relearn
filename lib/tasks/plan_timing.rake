# lib/tasks/rss.rake
namespace :plan_timing do
  # 1回目の復習タイミング通知
  task first_term_mail: :environment do
    # 計画していた通知時間がきているかチェックするメソッド
    send_users = PlanTiming.first_term_check
    unless send_users.empty?
      send_users.each do |user|
        RelearnMailer.first_term_mail(user).deliver_now
      end
    end
  end

  # 2回目の復習タイミング通知
  task second_term_mail: :environment do
    # 計画していた通知時間がきているかチェックするメソッド
    send_users = PlanTiming.second_term_check('second_term')
    unless send_users.empty?
      send_users.each do |user|
        RelearnMailer.second_term_mail(user).deliver_now
      end
    end
  end

  # 3回目の復習タイミング通知
  task third_term_mail: :environment do
    # 計画していた通知時間がきているかチェックするメソッド
    send_users = PlanTiming.third_term_check('third_term')
    unless send_users.empty?
      send_users.each do |user|
        RelearnMailer.third_term_mail(user).deliver_now
      end
    end
  end

  # 4回目の復習タイミング通知
  task forth_term_mail: :environment do
    # 計画していた通知時間がきているかチェックするメソッド
    send_users = PlanTiming.forth_term_check('forth_term')
    unless send_users.empty?
      send_users.each do |user|
        RelearnMailer.forth_term_mail(user).deliver_now
      end
    end
  end
end
