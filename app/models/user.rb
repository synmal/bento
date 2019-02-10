class User < ApplicationRecord
  include Clearance::User
  has_many :authentications, dependent: :destroy
  has_many :feeds, dependent: :destroy
  has_many :articles, through: :feeds, dependent: :destroy
  has_many :podcasts, through: :feeds, dependent: :destroy
  has_many :projects, through: :feeds, dependent: :destroy
  has_many :videos, through: :feeds, dependent: :destroy
  mount_uploader :avatar, AvatarUploader
  enum programming_level: [:beginner, :intermediate]
  enum roles: [:user, :admin]
  
  # allows access to the hash in the migration
  store_accessor :user_languages_skill

  def self.create_with_auth_and_hash(authentication, auth_hash)
    user = self.create!(
      first_name: auth_hash["info"]["name"].split[0],
      last_name: auth_hash["info"]["name"].split[1],
      email: auth_hash["info"]["email"],
      avatar: auth_hash["info"]["image"],
      password: SecureRandom.hex(10)
    )
    user.remote_avatar_url = auth_hash["info"]["image"]
    user.save
    user.authentications << authentication
    UserMailer.welcome_mail(user).deliver_now
    return user
  end
 
  # grab google to access google for user data
  def google_token
    x = self.authentications.find_by(provider: 'google_oauth2')
    return x.token unless x.nil?
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def feed
    article = []
    podcast = []
    video = []
    podcast_article_video = {}

    # Podcast
    if self.user_languages_skill
      self.user_languages_skill.keys.each do |lang|
        Podcast.where(tags: [lang], published_at: ((Time.now-7.day)..Time.now)).each do |i|
          podcast << i
        end
      end

      # Articles
      self.user_languages_skill.keys.each do |lang|
        Article.where(tags: [lang], published_at: ((Time.now-7.day)..Time.now)).each do |i|
          article << i
        end
      end

      # Video
      self.user_languages_skill.keys.each do |lang|
        Video.where(tags: [lang]).each do |i|
          video << i
        end
      end

      # Put in hash
      podcast_article_video['podcast'] = podcast
      podcast_article_video['article'] = article
      podcast_article_video['video'] = video
      podcast_article_video
    end
  end

  def feed_count
    self.feeds.count
  end
end