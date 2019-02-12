class SyncJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    all_topics = ['front-end', 'back-end', 'web-development', 'mobile', 'ruby', 'javascript', 'python', 'progressive-web-apps', 'chatbot', 'cybersecurity', 'motion-ui']
    all_topics.each do |topic|
      get_article(topic)
    end
  end

  def get_article(interest)
    rss = RSS::Parser.parse(open("https://medium.com/feed/tag/#{interest}"))
    rss.items.each do |item|
      article = Article.new
      article['title'] = item.title
      article['link'] = item.link
      article['parent_url'] = 'https://medium.com/'
      article['image'] = LinkThumbnailer.generate(item.link).images.first.src.to_s
      article['published_at'] = item.pubDate
      article.tags.push(interest)
      if article.save
  
      else
        a = Article.find_by(link: article.link)
        
        a.tags.push(interest)
        a.tags.uniq!
        a.save
      end
    end
  end

end
