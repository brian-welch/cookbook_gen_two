require 'open-uri'
require 'nokogiri'

file = 'strawberry.html'

doc = Nokogiri::HTML(open(file), nil, 'utf-8')
ingredient = 'strawberry'
url = "http://www.letscookfrench.com/recipes/find-recipe.aspx?aqt=#{ingredient}"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

recipes = []

html_doc.search('.m_contenu_resultat').each do |element|
  name = element.search('.m_titre_resultat')
  prep_time = element.search('.m_detail_time')
  description = element.search('.m_detail_recette')
  puts name.text.strip
  puts prep_time.text.strip
  puts description.text.strip
  # puts "\n\n"
  # puts element.attribute('href').value
  # recipes_array = [name, prep_time, description]
  # recipes << recipes_array
end

# puts recipes

# STRUCTURE --> <div class="m_contenu_resultat">
# RECIPE TITLE   --> <div class="m_titre_resultat">
# PREP TIME HTML --> <div class="m_detail_time">
# RECIPE DETAILS(DESCRIPTION) --> <div class="m_detail_recette"> EXAMPLE: <strong>Recipe</strong> - Dessert - Very easy - Cheap - Vegetarian</div>
