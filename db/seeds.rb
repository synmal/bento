# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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

# def get_quiz(num)
#   quiz = Nokogiri::HTML(open("https://projecteuler.net/problem=#{num}"))
#   quiz_info = quiz.xpath("//*[@class='problem_content']").to_html
#   quiz_img = quiz_info.gsub(/src=./, 'img src="https://projecteuler.net/')
#   Puzzle.create(description: quiz_img)

#   if open("https://projecteuler.net/problem=#{num}").base_uri.path == "/problem=#{num}"
#     get_quiz(num+1)
#   else
#     p "Done"
#   end
# end

# get_quiz(1)

# def get_quiz(num)
#   quiz = Nokogiri::HTML(open("https://projecteuler.net/problem=#{num}"))
#   quiz_info = quiz.xpath("//*[@class='problem_content']").to_html
#   quiz_img = quiz_info.gsub(/src=./, 'img src="https://projecteuler.net/')
#   Puzzle.create(description: quiz_img)

#   if open("https://projecteuler.net/problem=#{num}").base_uri.path == "/problem=#{num}"
#     get_quiz(num+1)
#   else
#     p "Done"
#   end
# end

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

channel_ids = [['UCxJaNyXCQw0mghY0hA1wA9w', 'ruby'], ['UCyU5wkjgQYGRB0hIHMwm2Sg', 'javascript'], ['UCRjTEkDLPREZNlREZMlotMQ', 'python']]
channel_ids.each do |channel_id|
  channel = Yt::Channel.new id: channel_id[0]
  videos = channel.videos.select :snippet
  video_ids = videos.map &:id
  video_titles = videos.map &:title
  video_ids.each_with_index do |video_id, i|

    next if Video.find_by(url: "https://www.youtube.com/watch?v=#{video_id}")

    video = Video.new(title: video_titles[i], channel: channel.title, url: "https://www.youtube.com/watch?v=#{video_id}")
    video.tags << channel_id[1]
    video.save
  end
  sleep(15)
end

# User.all.each do |user|
#   30.times do
#     feed = user.feeds.new(article_id: Article.all.sample.id, podcast_id: Podcast.all.sample.id, video_id: Video.all.sample.id, project_id: Project.all.sample.id, week: user.feeds.count + 1)
#     feed.save
#   end
# end

puts 'Done'