require_relative "view"
require_relative "ticket"
require_relative "../service/zendeskservice"

class Controller
    def initialize(zendeskservice)
        @zendeskservice = zendeskservice
        @view = View.new
    end

    def list
        display_tickets
    end

    private 

    def display_tickets
        tickets = @zendeskservice.result
        @view.display(tickets)
    end

end