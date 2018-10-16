require          'pry-byebug'
require_relative 'cb_repo'
require_relative 'cb_controller'
require_relative 'cb_router'
require_relative 'web_recipe_parser'

csv_file          = File.join(__dir__, 'recipes.csv')
cb_repo           = CbRepo.new(csv_file)
web_recipe_parser = WebRecipeParser.new
cb_controller     = CbController.new(cb_repo, web_recipe_parser)
router            = CbRouter.new(cb_controller)

router.run
