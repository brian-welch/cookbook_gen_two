require 'pry-byebug'

# cb recipe
class CbRecipeModel
  attr_accessor :title, :abstract, :time, :difficulty, :cooked # , :nutrition, :prep_time, :category, :tags, :img

  def initialize(args = {})
    @title      = args[:title]
    @abstract   = args[:abstract]
    @time       = args[:time]
    @difficulty = args[:difficulty]
    @cooked     = args[:cooked]
  end
end
