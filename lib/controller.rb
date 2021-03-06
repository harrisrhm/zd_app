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

    def show
        display_one_ticket
    end

    private 

    def display_tickets
        tickets = @zendeskservice.paginate
        @view.display_all(tickets)
    end

    def display_one_ticket
        tickets = @zendeskservice.transform
        @view.display_one(tickets)
    end
end