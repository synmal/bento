class UserMailer < ApplicationMailer

  def newsletter
    # @user = params[:user]
    @url  = 'http://localhost:3000'
    @user = User.last
    mail(to: @user.email, subject: 'Your Weekly Bento is Here')
  end

  def welcome_mail(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
