class UserMailer < ApplicationMailer

	def newsletter(user, article, podcast, video, project)
      @user = user
      @article = article
      @podcast = podcast
      @video = video
      @project = project
	    mail(to: @user.email, subject: 'Your Weekly Bento is Here')
	end

	def welcome_mail(user)
      @user = user
	    @url  = 'https://bento-next.herokuapp.com'
	    mail(to: @user.email, subject: 'Welcome to Bento')
	end
end

