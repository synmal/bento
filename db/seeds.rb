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