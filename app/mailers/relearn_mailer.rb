class RelearnMailer < ApplicationMailer
  # 1回目の復習タイミングメール送信メソッド
  def first_term_mail(user, plan)
    @user = user
    @plan = plan
    mail to: user.email,
         subject: 'ReLearn【1回目の復習タイミング通知】'
  end

  # 2回目の復習タイミングメール送信メソッド
  def second_term_mail(user, plan)
    @user = user
    @plan = plan
    mail to: user.email,
         subject: 'ReLearn【2回目の復習タイミング通知】'
  end

  # 3回目の復習タイミングメール送信メソッド
  def third_term_mail(user, plan)
    @user = user
    @plan = plan
    mail to: user.email,
         subject: 'ReLearn【3回目の復習タイミング通知】'
  end

  # 4回目の復習タイミングメール送信メソッド
  def forth_term_mail(user, plan)
    @user = user
    @plan = plan
    mail to: user.email,
         subject: 'ReLearn【4回目の復習タイミング通知】'
  end
end
