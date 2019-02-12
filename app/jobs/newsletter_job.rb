class NewsletterJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    User.all.each do |user|
      user.update_feed
      article = user.feeds.last.article
      podcast = user.feeds.last.podcast
      video = user.feeds.last.video
      project = user.feeds.last.project
      # next if !user.feeds.find_by(created_at: DateTime.now-7..DateTime.now)
      UserMailer.newsletter(user, article, podcast, video, project).deliver_now
    end
  end

  
end
