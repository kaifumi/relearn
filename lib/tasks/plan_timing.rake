# lib/tasks/rss.rake
namespace :plan_timing do
  # 1回目の復習タイミング通知
  task first_term_mail: :environment do
    # 計画していた通知時間がきているユーザーをチェックして格納
    user_plan_array = PlanTiming.first_term_check
    unless user_plan_array.empty?
      user_plan_array.each do |user, plan|
        RelearnMailer.first_term_mail(user, plan).deliver_now
      end
    end
  end

  # 2回目の復習タイミング通知
  task second_term_mail: :environment do
    # 計画していた通知時間がきているユーザーをチェックして格納
    user_plan_array = PlanTiming.second_term_check
    unless user_plan_array.empty?
      user_plan_array.each do |user, plan|
        RelearnMailer.second_term_mail(user, plan).deliver_now
      end
    end
  end

  # 3回目の復習タイミング通知
  task third_term_mail: :environment do
    # 計画していた通知時間がきているユーザーをチェックして格納
    user_plan_array = PlanTiming.third_term_check
    unless user_plan_array.empty?
      user_plan_array.each do |user, plan|
        RelearnMailer.third_term_mail(user, plan).deliver_now
      end
    end
  end

  # 4回目の復習タイミング通知
  task forth_term_mail: :environment do
    # 計画していた通知時間がきているユーザーをチェックして格納
    user_plan_array = PlanTiming.forth_term_check
    unless user_plan_array.empty?
      user_plan_array.each do |user, plan|
        RelearnMailer.forth_term_mail(user, plan).deliver_now
      end
    end
  end
end
