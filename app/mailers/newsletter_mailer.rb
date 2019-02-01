class NewsletterMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def NewsletterMailer
    # @user = params[:user]
    @url  = 'http://localhost:3000'

    User.all.each do |user|
      mail(to: user.email, subject: 'Your Weekly Bento is Here')
    end
  end
end
