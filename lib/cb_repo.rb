require          'pry-byebug'
require          'csv'
require_relative 'cb_recipe_model'

# cb repo
class CbRepo
  def initialize(csv_file)
    @recipes     = []
    @csv_file    = csv_file
    @csv_headers = %w[title abstract timing diffculty cooked]
    @csv_opt     = { col_sep: ',', force_quotes: true,
                     quote_char: '"', headers: :first_row }

    CSV.foreach(@csv_file, @csv_opt) { |row| @recipes << instance_builder(row) }
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

  def mark_recipe(recipe_index)
    @recipes[recipe_index].cooked = 'true'
    write_csv
  end

  def instance_builder(arr)
    CbRecipeModel.new(title: arr[0], abstract: arr[1], time: arr[2],
                      difficulty: arr[3], cooked: arr[4])
  end

  private

  def write_csv
    CSV.open(@csv_file, 'wb', @csv_opt) do |csv|
      csv << @csv_headers
      @recipes.each do |elem|
        csv << [elem.title, elem.abstract, elem.time, elem.difficulty, elem.cooked]
      end
    end
  end
end
