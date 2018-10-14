  def display_title
    system 'clear'
    puts ""
    puts "    ╔─═─═─═─═─═─═─═─═─═─═─═─═─═─═─═─═─═─═─═─═─╗"
    puts "    │         Welcome to the Cookbook         │"
    puts "    ╚─═─═─═─═─═─═─═─═─═─═─═─═─═─═─═─═─═─═─═─═─╝"
    puts ""
    #display_error
  end

  def display_tasks
    puts "What action would you like to take?\n\n"
    puts "[1] - List all recipes"
    puts "[2] - Create a new recipe"
    puts "[3] - Delete a recipe"
    puts "[4] - Fetch Recipes from the web and save them"
    puts "[5] - Stop and exit the program"
    print ">> "
  end

  def display_error
      puts "°·.·°·.·°·.·°·.·°·.·°·.·°·.·°·.·°"
      puts "You did not select a valid number"
      puts "°·.·°·.·°·.·°·.·°·.·°·.·°·.·°·.·°"
  end


display_title
display_tasks
