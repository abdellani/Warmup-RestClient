require 'rest-client'
require 'rubygems'
require 'nokogiri'



class Bing
  
  def query (input)
    link = "https://www.bing.com/search"
    html= RestClient.get link, {params: {q: "#{input}"}}
    ng = Nokogiri::HTML(html)
    titles=[]
    counter = 0
    ng.css('#b_results>li h2,#b_results>li p,#b_results>li cite').each do |x|
      if counter % 3 == 0
        titles << "\n"
      end
      titles << x.text
      counter += 1
    end
    response(titles)
  end

  def response(response)
    puts response
  end

end

action = true

while action
  search = Bing.new
  puts 'Please enter the search term'
  input = gets.chomp
  search.query(input)

  puts 'Do You want to search again? Y/N'
  answer = gets.chomp.capitalize
  if answer != 'Y'
    action = false
  end

end

