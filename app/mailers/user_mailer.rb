class UserMailer < ApplicationMailer

	def newsletter(user)
	    @user = user
	    mail(to: @user.email, subject: 'Your Weekly Bento is Here')
	end


 	def welcome_mail
	    @user = User.first
	    @url  = 'http://localhost:3000/'
	    mail(to: @user.email, subject: 'Welcome to BENTO Site')
	end

	def welcome_mail(user)
	    @user = user
	    @url  = 'http://localhost:3000'
	    mail(to: @user.email, subject: 'Welcome to Bento')

	end
end

