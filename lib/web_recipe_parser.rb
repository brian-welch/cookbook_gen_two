require          'pry-byebug'
require          'nokogiri'
require          'open-uri'
require_relative 'cb_recipe_model'

# web_recipe_parser
class WebRecipeParser
  def web_recipe_getter(keyword)
    search_url = "http://www.letscookfrench.com/recipes/find-recipe.aspx?aqt=#{keyword}"
    web_recipe_array = []

    html_doc = Nokogiri::HTML(open(search_url), nil, 'utf-8')
    html_doc.search('.m_item.recette_classique').each_with_index do |recipe, i|
      tmp_array = []
      if i < 5
        tmp_array << recipe.search('.m_titre_resultat a').text.strip
        tmp_array << recipe.search('.m_texte_resultat').text.strip
        tmp_array << time_polisher(recipe)
        tmp_array << recipe.search('.m_detail_recette').text.strip.split(" - ")[2]
        tmp_array << 'false'
        web_recipe_array << tmp_array
      end
    end
    web_recipe_array # an array of arrays - five recipes
  end

  def time_polisher(recipe)
     x = recipe.search('.m_detail_time').text.strip.gsub(/^\W+/,'Prep: ').gsub(/[^\s{1}a-zA-Z0-9:\.]+/,', Cook Time:')
     x.length > 0 ? x : 'Cook time not available'
  end
end
