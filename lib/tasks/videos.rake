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

  

  channel = Yt::Channel.new id: 'UCeeFfhMcJa1kjtfZAGskOCA'
  # p channel.title
  # p channel.vanity_url
  videos = channel.videos.select :snippet, :statistics
  a = videos.map &:title
  a.each do |vid|
    p vid
  end
  # p videos.map &:id
end