class NewsletterJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    update_feed
    User.all.each do |user|
        next if !user.feeds.find_by(created_at: DateTime.now-7..DateTime.now)
        UserMailer.newsletter(user).deliver_now
    end
  end

  def update_feed
    User.all.each do |user|
      feed = user.feeds.new
      all_feed = user.feed

      if !user.developer_type.empty? && !user.interest.empty? && !user.user_languages_skill.empty?
        article = all_feed['article'].sample
        feed['article_id'] = article.id
      end

      if !user.user_languages_skill.empty?
        podcast = all_feed['podcast'].sample
        video = all_feed['video'].sample
        feed['podcast_id'] = podcast.id
        feed['video_id'] = video.id
      end
      
      project = Project.all.sample
      feed['project_id'] = project.id

      feed.save
    end
  end
end
