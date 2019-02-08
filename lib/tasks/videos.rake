## Ruby
# GoRails - UCIQmhQxCvLHRr3Beku77tww
# Drifting Ruby - UCxJaNyXCQw0mghY0hA1wA9w

## Javascript
# Traversy Media - UC29ju8bIPH5as8OGnQzwJyA
# LevelUpTuts - UCyU5wkjgQYGRB0hIHMwm2Sg

## Python
# Al Sweigart - UCRjTEkDLPREZNlREZMlotMQ
# Corey Schafer - UCCezIgC97PvUuR4_gbFUs5g

task :get_videos => :environment do
  channel_ids = [['UCxJaNyXCQw0mghY0hA1wA9w', 'ruby'], ['UCyU5wkjgQYGRB0hIHMwm2Sg', 'javascript'], ['UCRjTEkDLPREZNlREZMlotMQ', 'python']]
  channel_ids.each do |channel_id|
    channel = Yt::Channel.new id: channel_id[0]
    videos = channel.videos.select :snippet
    video_ids = videos.map &:id
    video_titles = videos.map &:title
    video_ids.each_with_index do |video_id, i|
      next if Video.where(url: "https://www.youtube.com/watch?v=#{video_id}")
      video = Video.new(title: video_titles[i], channel: channel.title, url: "https://www.youtube.com/watch?v=#{video_id}")
      video.tags << channel_id[1]
      video.save
    end
    sleep(15)
  end
end