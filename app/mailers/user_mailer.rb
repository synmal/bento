class UserMailer < ApplicationMailer

  def newsletter(user)
    @user = user
    mail(to: @user.email, subject: 'Your Weekly Bento is Here')
  end

  def welcome_mail(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
