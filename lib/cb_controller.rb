require          'pry-byebug'
require_relative 'web_recipe_parser'
require_relative 'cb_recipe_model'
require_relative 'cb_repo'
require_relative 'cb_view'

# controller
class CbController
  def initialize(cb_repo, web_recipe_parser)
    @cb_repo           = cb_repo
    @view              = CbView.new
    @web_recipe_parser = web_recipe_parser
  end

  def list
    display_recipes
  end

  def create
    user_recipe = @view.ask_user_for_recipe
    new_recipe = @cb_repo.instance_builder(user_recipe) # taken from CbRepo
    @cb_repo.add_recipe(new_recipe)
  end

  def web
    keyword = @view.ask_user_for_keyword
    web_recipes = @web_recipe_parser.web_recipe_getter(keyword)
    to_import = @view.import(web_recipes)
    web_recipe = @cb_repo.instance_builder(to_import)
    display_title
    @view.confirm_massage(to_import[0], 3)
    @cb_repo.add_recipe(web_recipe)
  end

  def destroy
    recipe_index = @view.ask_user_what_to_delete(recipe_array)
    @cb_repo.remove_recipe(recipe_index)
  end

  def mark
    recipe_index = @view.ask_user_what_to_mark(recipe_array)
    @cb_repo.mark_recipe(recipe_index)
  end

  private

  def recipe_array
    @cb_repo.all
  end

  def display_recipes
    @view.show_all_recipes(@cb_repo.all)
  end
end
