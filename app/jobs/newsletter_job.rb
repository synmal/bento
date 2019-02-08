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
      article = all_feed['article'].sample if !user.developer_type.empty? && !user.interest.empty? && !user.user_languages_skill.empty?
      podcast = all_feed['podcast'].sample if !user.user_languages_skill.empty?
      project = Project.all.sample
      video = all_feed['video'].sample if !user.user_languages_skill.empty?
      feed = user.feeds.new(article_id: article.id, podcast_id: podcast.id, project_id: project.id, video_id: video.id)
      feed.save
    end
  end
end
