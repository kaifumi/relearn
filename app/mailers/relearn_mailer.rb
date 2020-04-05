class RelearnMailer < ApplicationMailer
  # 1回目の復習タイミングメール送信メソッド
  def first_term_mail(user)
    @user = user
    mail to: user.email,
         subject: '【1回目の復習タイミング通知】ReLearn'
  end

  # 2回目の復習タイミングメール送信メソッド
  def second_term_mail(user)
    @user = user
    mail to: user.email,
         subject: '【2回目の復習タイミング通知】ReLearn'
  end

  # 3回目の復習タイミングメール送信メソッド
  def third_term_mail(user)
    @user = user
    mail to: user.email,
         subject: '【3回目の復習タイミング通知】ReLearn'
  end

  # 4回目の復習タイミングメール送信メソッド
  def forth_term_mail(user)
    @user = user
    mail to: user.email,
         subject: '【4回目の復習タイミング通知】ReLearn'
  end
end
