# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


def get_quiz(num)
  quiz = Nokogiri::HTML(open("https://projecteuler.net/problem=#{num}"))
  quiz_info = quiz.xpath("//*[@class='problem_content']").to_html
  quiz_img = quiz_info.gsub(/src=./, 'img src="https://projecteuler.net/')
  Puzzle.create(description: quiz_img)

  if open("https://projecteuler.net/problem=#{num}").base_uri.path == "/problem=#{num}"
    get_quiz(num+1)
  else
    p "Done"
  end
end

get_quiz(1)

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

# get_course('beginner', 'javascript')
# get_course('intermediate', 'javascript')
# get_course('beginner', 'ruby')
# get_course('intermediate', 'ruby')
# get_course('beginner', 'python')
# get_course('intermediate', 'python')
# get_course('beginner', 'ios')
# get_course('intermediate', 'ios')

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

