class NewsletterJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    update_feed
    User.all.each do |user|
      UserMailer.newsletter(user).deliver_now
    end
  end

  def update_feed
    User.all.each do |user|
      all_feed = user.feed
      article = all_feed['article'].sample
      podcast = all_feed['podcast'].sample
      project = Project.all.sample
      feed = user.feeds.new(article_id: article.id, podcast_id: podcast.id, project_id: project.id)
      feed.save
    end
  end
end
