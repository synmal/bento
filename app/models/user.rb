class User < ApplicationRecord
  include Clearance::User
  has_many :authentications, dependent: :destroy
  has_many :articles
  has_many :podcasts
  mount_uploader :avatar, AvatarUploader
  enum programming_level: [:beginner, :intermediate]
  
  # allows access to the hash in the migration
  store_accessor :user_languages_skill

  def self.create_with_auth_and_hash(authentication, auth_hash)
    user = self.create!(
      first_name: auth_hash["info"]["first_name"],
      last_name: auth_hash["info"]["last_name"],
      email: auth_hash["info"]["email"],
      password: SecureRandom.hex(10)
    )
    user.authentications << authentication
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

  def user_article
    # empty array to hold Article obj
    list = []
    # loop through each language
    self.user_languages_skill.keys.each do |lang|
      # find article with tags based on language
      Article.where(tags: [lang]).each do |i|
        list << i
      end
    end
    list
  end

  def user_podcast
    list = []
    self.user_languages_skill.keys.each do |lang|
      Podcast.where(tags: [lang]).each do |i|
        list << i
      end
    end
    list
  end

  def feed
    article = []
    podcast = []
    podcast_article = {}

    # Podcast
    self.user_languages_skill.keys.each do |lang|
      Podcast.where(tags: [lang], published_at: ((Time.now-7.day)..Time.now)).limit(3).order(published_at: :desc).each do |i|
        podcast << i
      end
    end

    # Articles
    self.user_languages_skill.keys.each do |lang|
      Article.where(tags: [lang], published_at: ((Time.now-7.day)..Time.now)).limit(3).order(published_at: :desc).each do |i|
        article << i
      end
    end

    # Put in hash
    podcast_article['podcast'] = podcast
    podcast_article['article'] = article
    podcast_article
  end
end