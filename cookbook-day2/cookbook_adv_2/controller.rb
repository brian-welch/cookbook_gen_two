require 'nokogiri'
require 'open-uri'

file = 'strawberry.html'
doc = Nokogiri::HTML(File.open(file), nil, 'utf-8')

require_relative 'view'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    display_all_recipes
  end

  def create
    name = @view.ask_for("recipe name")
    description = @view.ask_for("recipe description")
    recipe = Recipe.new(name, description)
    @cookbook.add_recipe(recipe)
  end

  def destroy
    display_all_recipes
    recipe_index = @view.ask_for("Recipe number to destroy") - 1
    @cookbook.remove_recipe(recipe_index)
  end

  private

  def display_all_recipes
    recipes = @cookbook.all
    @view.display(recipes)
  end

  def import_recipe

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
  recipes << [recipe.name, recipe.prep_time, recipe.description]
  end
  end
end
