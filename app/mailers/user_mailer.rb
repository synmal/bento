class UserMailer < ApplicationMailer

  def newsletter(user)
    @user = user
    mail(to: @user.email, subject: 'Your Weekly Bento is Here')
  end

<<<<<<< HEAD
  def welcome_mail
    @user = User.first
    @url  = 'http://localhost:3000/'
    mail(to: @user.email, subject: 'Welcome to My BENTO Site')
=======
  def welcome_mail(user)
    @user = user
    @url  = 'http://localhost:3000'
    mail(to: @user.email, subject: 'Welcome to Bento')
>>>>>>> upstream/master
  end
end
