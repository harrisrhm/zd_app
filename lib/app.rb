require_relative '../service/zendeskservice'
require_relative 'controller'
require_relative 'router'

zendeskservice = ZendeskService.new
controller = Controller.new(zendeskservice)

router = Router.new(controller)

# Start the app
router.run