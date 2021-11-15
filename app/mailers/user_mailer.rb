class UserMailer < ApplicationMailer
  def account_activation(user)
    @user = user
    mail to: user.email, subject: 'アクティベーションをしてください'
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: 'パスワードをリセットしてください'
  end
end
