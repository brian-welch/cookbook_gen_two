class View
  def display(recipes)
    recipes.each_with_index do |recipe, idx|
      puts "#{idx + 1} - #{recipe.name} | #{recipe.description}"
    end
  end

  def ask_for(label)
    puts "What #{label}?"
    user_input = gets.chomp
    user_input =~ /\d+/ ? user_input.to_i : user_input
  end
end
