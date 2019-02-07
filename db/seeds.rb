# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# def get_article(interest)
#   rss = RSS::Parser.parse(open("https://medium.com/feed/tag/#{interest}"))
#   rss.items.each do |item|
#     article = Article.new
#     article['title'] = item.title
#     article['link'] = item.link
#     article['content'] = item.content_encoded
#     article['parent_url'] = 'https://medium.com/'
#     article.tags.push(interest)
#     if article.save

#     else
#       a = Article.find_by(link: article.link)
#       # byebug
#       a.tags.push(interest)
#       a.tags.uniq!
#       a.save
#     end
#   end
# end

# get_article('front-end')
# get_article('back-end')
# get_article('web-development')
# get_article('mobile-development')

