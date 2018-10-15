require 'csv'
require_relative 'recipe'
class Cookbook
  def initialize(csv_path)
    @csv_path = csv_path
    @recipes = []
    @csv_options = { quote_char: '"', force_quotes: true, col_sep: ","}
    load_csv
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
    CSV.open(@csv_path, 'wb', @csv_options) do |csv|
      @recipes.each do |recipe|
        csv << [ recipe.name, recipe.description ]
      end
    end
  end

  def load_csv
    CSV.foreach(@csv_path, @csv_options) do |row|
      @recipes << Recipe.new(row[0], row[1])
    end
  end

  def import_recipe
    recipes = []

    html_doc.search('.m_contenu_resultat').each do |element|
    name = element.search('.m_titre_resultat')
    prep_time = element.search('.m_detail_time')
    description = element.search('.m_detail_recette')
    # puts name.text.strip
    # puts prep_time.text.strip
    # puts description.text.strip
    recipes << [recipe.name, recipe.prep_time, recipe.description]
    end
  end
end
