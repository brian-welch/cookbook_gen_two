require          'pry-byebug'
require          'csv'
require_relative 'cb_recipe_model'

class CbRepo
  def initialize(csv_file_path)
    @recipes = []
    @csv_file_path = csv_file_path
    @csv_header_array = ["title","sub title","ingredients","method","difficulty",
                         "nuritional information","prep time","category","tags","img"]
    # binding.pry
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"', headers: :first_row }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      @recipes << CbRecipeModel.new(row[0], row[1], row[2], row[3]) # , row[4])
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
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"', headers: :first_row }
    CSV.open(@csv_file_path, 'wb', csv_options) do |csv|
      csv << @csv_header_array
      @recipes.each do |recipe|
        csv << [recipe.title, recipe.sub_title]
      end
    end
  end
end
