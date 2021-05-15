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

    def show
        display_tickets
        ticket_id = @view.ask_user_for_ticket_id
        display_one_ticket
        # @ticket.display(ticket_id)
    end

    private 

    def display_tickets
        tickets = @zendeskservice.transform
        @view.display_all(tickets)
    end

    def display_one_ticket
        tickets = @zendeskservice.transform
        @view.display_one(tickets)
    end

end