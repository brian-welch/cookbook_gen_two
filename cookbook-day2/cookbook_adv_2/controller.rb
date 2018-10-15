require 'nokogiri'
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
end

<div id="ctl00_cphMainContent_m_ctrlSearchEngine_m_ctrlSearchListDisplay_rptResultSearch_ctl01_m_panelResul" class="m_item recette_classique">

# STRUCTURE --> <div class="m_contenu_resultat">
# RECIPE TITLE   --> <div class="m_titre_resultat">
# PREP TIME HTML --> <div class="m_detail_time">
# RECIPE DETAILS(DESCRIPTION) --> <div class="m_detail_recette"> EXAMPLE: <strong>Recipe</strong> - Dessert - Very easy - Cheap - Vegetarian</div>
