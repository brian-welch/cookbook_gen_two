# New class
class Recipe
  attr_reader :name, :description, :prep_time
  def initialize(name, description)
    @name = name
    @description = description
    @prep_time = prep_time
  end
end

# Ask a user for a keyword to search
# Make an HTTP request to the recipe's website with our keyword
# Parse the HTML document to extract the first 5 recipes suggested and store them in an Array
# Display them in an indexed list
# Ask the user which recipe they want to import (ask for an index)
# Add it to the Cookbook
