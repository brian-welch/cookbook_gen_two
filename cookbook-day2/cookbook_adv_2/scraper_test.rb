require 'open-uri'
require 'nokogiri'

file = 'strawberry.html'

doc = Nokogiri::HTML(File.open(file), nil, 'utf-8')
ingredient = 'strawberry'
url = "http://www.letscookfrench.com/recipes/find-recipe.aspx?aqt=#{ingredient}"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

html_doc.search('.m_titre_resultat a').each do |element|
  puts element.text.strip
  # puts element.attribute('href').value
end
