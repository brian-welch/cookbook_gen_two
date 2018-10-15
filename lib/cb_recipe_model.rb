require 'pry-byebug'

class CbRecipeModel
  attr_accessor :title, :sub_title, :ingred, :method

  def initialize(title, sub_title, ingred, method) # , args = {})
    @title      = title # string
    @sub_title  = sub_title # string
    @ingred     = ingred # array
    @method     = method # string

    # @difficulty = args[:difficulty].to_s # string
    # @prep_time  = args[:prep_time].to_s # string
    # @nurition   = args[:nurition].to_s # hash
    # @category   = args[:category].to_s # array
    # @tags       = args[:tags].to_s # array
    # @img        = args[:img].to_s # string

    @cooked     = false
  end
end
