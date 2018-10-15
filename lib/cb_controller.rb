require          'pry-byebug'
require_relative 'web_recipe_parser'
require_relative 'cb_recipe_model'
require_relative 'cb_repo'
require_relative 'cb_view'

# controller
class CbController
  def initialize(cb_repo)
    @cb_repo = cb_repo
    @view = CbView.new
  end

  def list
    display_recipes
  end

  def create
    details = @view.ask_user_for_recipe
    new_recipe = CbRecipeModel.new(details[0], details[1],'','')
    @cb_repo.add_recipe(new_recipe)
  end

  def destroy
    recipe_index = @view.ask_user_what_to_delete(recipe_array)
    @cb_repo.remove_recipe(recipe_index)
  end

  private

  def

  def recipe_array
    @cb_repo.all
  end

  def display_recipes
    @view.show_all_recipes(@cb_repo.all)
  end
end
