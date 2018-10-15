require          'pry-byebug'
require_relative 'title'

# cookbook viewer
class CbView
  def show_all_recipes(all_recipes)
    display_title
    puts "Here are all your recipes:\n========================="
    all_recipes.each.with_index { |each, i| puts "[#{i + 1}] #{each.title}: #{each.sub_title}" }
  end

  def ask_user_for_recipe
    display_title
    puts "What is the name of your new recipe?"
    print ">> "
    new_recipe_name = gets.chomp
    puts "\nDescribe the recipe."
    print ">> "
    new_recipe_description = gets.chomp
    display_title
    confirm_massage("created")
    [new_recipe_name, new_recipe_description,'','']
  end

  def ask_user_what_to_delete(recipe_array)
    display_title
    recipe_array.each_with_index { |each, i| puts "[#{i + 1}] - #{each.name}" }
    puts "\n\n"
    puts "What's the number of the recipe you want to delete?"
    puts " - - - - - - - - - - - - - - - - - - - - - - - - -\n"
    print ">> "
    index = gets.chomp.to_i - 1
    display_title
    confirm_massage("deleted")
    index
  end

  def confirm_massage(word)
    puts "°·.·°·.·°·.·°·.·°·.·°·.·°·.·°·.·°"
    puts "    Your recipe was #{word}!!"
    puts "°·.·°·.·°·.·°·.·°·.·°·.·°·.·°·.·°"
  end
end
