require_relative "view"
require_relative "ticket"
require_relative "../service/zendeskservice"

class Controller
    def initialize(zendeskservice)
        @zendeskservice = zendeskservice
        @zendeskservice = ZendeskService.new
        @view = View.new
    end

    def list
        display_tickets
    end

    private 

    def display_tickets
        tickets = @zendeskservice.transform
        @view.display(tickets)
    end

end