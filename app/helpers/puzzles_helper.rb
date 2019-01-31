module PuzzlesHelper
  def get_quiz(link)
    quiz = Nokogiri::HTML(open("https://projecteuler.net/#{link}"))
    quiz_info = quiz.xpath("//*[@class='problem_content']").text
    Quiz.new(quiz_info)
  end
  
  def fetch_quiz
    data = Nokogiri::HTML(open("https://projecteuler.net/archives"))
    
    tags = data.xpath("//tr//a")
    
    tags.each do |a|
      get_quiz(a[:href])
    end
  end
end
