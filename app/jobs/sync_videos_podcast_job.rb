class SyncVideosPodcastJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    get_project

    all_podcast = [['http://feeds.5by5.tv/rubyonrails', 'ruby'], ['https://feeds.feedwrench.com/JavaScriptJabber.rss', 'javascript'], ['https://talkpython.fm/episodes/rss', 'python']]

    all_podcast.each do |podcast|
      get_podcast(podcast[0], podcast[1])
    end

    get_video
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

  def get_video
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
  end
end
