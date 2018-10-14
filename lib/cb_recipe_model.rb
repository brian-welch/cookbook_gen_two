require 'pry-byebug'

class CbRecipeModel
  attr_accessor :name, :description

  def initialize(name, description)
    @name = name
    @description = description
  end
end
