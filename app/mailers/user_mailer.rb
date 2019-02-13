class UserMailer < ApplicationMailer

	def newsletter(user)
      @user = user
      @article = @user.feeds.last.article if user.feeds.last.article
      @podcast = @user.feeds.last.podcast if user.feeds.last.podcast
      @video = @user.feeds.last.video
      @project = @user.feeds.last.project
	    mail(to: @user.email, subject: 'Your Weekly Bento is Here')
	end

	def welcome_mail(user)
      @user = user
	    @url  = 'https://bento-next.herokuapp.com'
	    mail(to: @user.email, subject: 'Welcome to Bento')
	end
end

