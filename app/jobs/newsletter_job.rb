class NewsletterJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    User.all.each do |user|
      user.update_feed
      next if !user.feeds.find_by(created_at: DateTime.now-7..DateTime.now)
      UserMailer.newsletter(user).deliver_now
    end
  end

  
end
