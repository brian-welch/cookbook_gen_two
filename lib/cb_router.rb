require          'pry-byebug'
require_relative 'title'

# Router
class CbRouter
  def initialize(cb_controller)
    @cb_controller = cb_controller
    @running       = true
  end

  def run
    display_title

    while @running
      display_tasks
      action = gets.chomp.to_i
      print `clear`
      route_action(action)
    end
  end

  private

  def route_action(action)
    case action
    when 1 then @cb_controller.list
    when 2 then @cb_controller.create
    when 3 then @cb_controller.web
    when 4 then @cb_controller.destroy
    when 5 then @cb_controller.mark
    when 0 then stop
    else
      display_title
      display_error
    end
  end

  def stop
    @running = false
  end

  def display_tasks
    puts "\n\n"
    puts "What action would you like to take?"
    puts "- - - - - - - - - - - - - - - - - -\n"

    # puts "\nWhat action would you like to take?\n\n"

    puts "[1] - List all recipes"
    puts "[2] - Create a new recipe by hand"
    puts "[3] - Fetch Recipes from #{"www.letscookfrench.com".upcase}"
    puts "[4] - Delete a recipe"
    puts "[5] - Mark a recipe as 'cooked'"
    puts "[0] - Stop and exit the program"
    print ">> "
  end

  def display_error
    x = "You did not select a valid number. '0' to quit."
    puts "\t#{"°·.·" * ((x.length / 4) + 3)}"
    puts "\t    #{x}"
    puts "\t#{"°·.·" * ((x.length / 4) + 3)}"
  end
end
