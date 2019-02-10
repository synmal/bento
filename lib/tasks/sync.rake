task :sync => :environment do
  # puts "Sup"

  # def get_course(level, language)
  #   page = Nokogiri::HTML(open("https://www.skillshare.com/search?query=#{level}%20#{language}"))
  #   link_text = page.xpath("//*[@class='ss-card__title']/a")
  #   link_text.map { |link|
  #     course = Course.new
  #     course['title'] = link.children.text
  #     course['link'] = link['href']
  #     course['parent_url'] = 'https://www.skillshare.com/'
  #     course.tags.push(level, language)
  
  #     if course.save
  
  #     else
  #       a = Course.find_by(link: course.link)
  #       # byebug
  #       a.tags.push(level, language)
  #       a.tags.uniq!
  #       a.save
  #     end
  #   }
  # end
  
  def get_article(interest)
    rss = RSS::Parser.parse(open("https://medium.com/feed/tag/#{interest}"))
    rss.items.each do |item|
      article = Article.new
      article['title'] = item.title
      article['link'] = item.link
      # article['content'] = item.content_encoded
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

  def get_podcast(feed, interest)
    feed = Feedjira::Feed.fetch_and_parse feed
    feed.entries.each do |entry|
      podcast = Podcast.new
      podcast['link'] = entry.url
      podcast['creator'] = feed.title
      podcast['title'] = entry.title
      podcast['tags'] = [interest]
      podcast['published_at'] = entry.published
      podcast['images'] = feed.itunes_image
      if podcast.save
  
      else
        a = Podcast.find_by(link: entry.url)
        # byebug
        a.tags.push(interest)
        a.tags.uniq!
        a.save
      end
    end
  end

  def get_project
    list = Nokogiri::HTML(open('https://github.com/karan/Projects/blob/master/README.md'))
    title = list.xpath("//p/strong/text()")
    title.each do |t|
      next if title.index(t) < 2 || Project.find_by(title: t.text)
      description = list.xpath("//p[#{title.index(t) + 5}]/text()")
      project = Project.new(title: t.text, description: description)
      project.save
    end
  end
  
  get_project

  
  get_article('front-end')
  get_article('back-end')
  get_article('web-development')
  get_article('mobile-development')
  get_article('ruby')
  get_article('javascript')
  get_article('python')

  get_podcast('http://feeds.5by5.tv/rubyonrails', 'ruby')
  get_podcast('https://feeds.feedwrench.com/JavaScriptJabber.rss', 'javascript')
  get_podcast('https://talkpython.fm/episodes/rss', 'python')

  get_project

  puts 'Done'
end