require          'pry-byebug'
require_relative 'cb_repo'    # You need to create this file!
require_relative 'cb_controller'  # You need to create this file!
require_relative 'cb_router'

csv_file   = File.join(__dir__, 'recipes.csv')
# binding.pry
cb_repo   = CbRepo.new(csv_file)
cb_controller = CbController.new(cb_repo)

router = CbRouter.new(cb_controller)

# Start the app
router.run
