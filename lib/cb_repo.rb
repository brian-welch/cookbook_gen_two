require          'pry-byebug'
require          'csv'
require_relative 'cb_recipe_model'

class CbRepo
  def initialize(csv_file_path)
    @recipes = []
    @csv_file_path = csv_file_path
    # binding.pry
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      @recipes << CbRecipeModel.new(row[0], row[1])
    end
  end

  def all
    @recipes
  end

  def add_recipe(new_recipe)
    @recipes << new_recipe
    write_csv
  end

  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
    write_csv
  end

  private

  def write_csv
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
    CSV.open(@csv_file_path, 'wb', csv_options) do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description]
      end
    end
  end
end
