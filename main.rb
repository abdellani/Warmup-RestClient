require 'rest-client'
require 'rubygems'
require 'nokogiri'

puts "Welcome "
puts "Plea"

link = "https://www.bing.com/search"
html= RestClient.get link, {params: {q: "ruby"}}

ng = Nokogiri::HTML(html)
titles=[]
ng.css('#b_results>li h2,#b_results>li p,#b_results>li cite').each do |x|
  titles << x.text
end
puts titles
