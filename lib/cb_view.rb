require          'pry-byebug'
require_relative 'title'

# cookbook viewer
class CbView
  def show_all_recipes(all_recipes)
    display_title
    puts "Here are all your recipes:\n========================="
    all_recipes.each.with_index do |elem, i|
      puts "\n[#{i + 1}] #{marked?(elem)} Recipe Name:\n" \
           "\t#{elem.title.capitalize}\n" \
           "\t#{'· ' * 25}\n\tTime:\n\t#{elem.time}\n\n" \
           "    #{'=' * 70}"
    end
  end

  def marked?(recipe)
    recipe.cooked == 'false' ? '[ ]' : '[X]'
  end

  def ask_user_for_recipe
    display_title
    n_title      = input_getter("title")
    n_abstract   = input_getter("abstract")
    n_time       = input_getter("time")
    n_difficulty = input_getter("difficulty")
    display_title
    confirm_massage('created', 1)
    [n_title, n_abstract, n_time, n_difficulty, 'false']
  end

  def input_getter(use)
    case use
    when "title" then puts "Title of your new recipe"
    when "abstract" then puts "\nWrite an abstract"
    when "time" then puts "\nTime to prepare(and cook if available)"
    when "difficulty" then puts "\nDifficutly level"
    when "cook" then puts "\nDifficutly level"
    end
    print ">> "
    gets.chomp
  end

  def ask_user_what_to_delete(recipe_array)
    display_title
    recipe_array.each_with_index { |each, i| puts "[#{i + 1}] - #{each.title}" }
    index = delete_update_mark_prompt('delete')
    display_title
    confirm_massage("deleted", 1)
    index
  end

  def ask_user_what_to_mark(recipe_array)
    display_title
    recipe_array.each_with_index { |each, i| puts "[#{i + 1}] - #{each.title}" }
    index = delete_update_mark_prompt('cook')
    display_title
    confirm_massage("cooked", 1)
    index
  end

  def delete_update_mark_prompt(use)
    case use
    when 'delete'
      puts x = "\n\nNumber of the recipe you want to delete?"
      puts "#{"- " * ((x.length / 2) + 1)}\n"
    when 'cook'
      puts x = "\n\nNumber of the recipe you want to mark 'cooked'?"
      puts "#{'- ' * ((x.length / 2) + 1)}\n"
    end
    print ">> "
    gets.chomp.to_i - 1
  end

  # recipe_short_list { recipe_array.each_with_index { |each, i| puts "[#{i + 1}] - #{each.title}" } }

  def ask_user_for_keyword
    display_title
    puts "\n\n"
    puts x = "Enter your keyword to search on '#{"www.letscookfrench.com".upcase}'?"
    puts "#{"- " * ((x.length / 2) + 1)}\n"
    print ">> "
    keyword = gets.chomp
    display_title
    confirm_massage(keyword, 2)
    keyword
  end

  def import(web_recipes)
    web_recipes.each_with_index { |arr, i| puts "[#{i + 1}] - #{arr[0]} | #{arr[2]}" }
    puts "\n\n"
    puts x = "Enter the number of the recipe you want to import?"
    puts "#{"- " * ((x.length / 2) + 1)}\n"
    print ">> "
    index = gets.chomp.to_i
    web_recipes[index - 1]
  end

  def confirm_massage(word, identifier)
    case identifier
    when 1 then x = "Your recipe was #{word.upcase}!"
    when 2 then x = "#{word.upcase} yielded the following top five recipes"
    when 3 then x = "'#{word.upcase}' has been imported!"
    end
    puts "\t#{"°·.·" * ((x.length / 4) + 2)}"
    puts "\t    #{x}"
    puts "\t#{"°·.·" * ((x.length / 4) + 2)}"
  end
end
