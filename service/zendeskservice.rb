require "json"
require "zendesk_api"
require "open-uri"
require "date"
require_relative "../lib/ticket"

class ZendeskService
    def get_client
      clients_hash = JSON.parse(open("https://harrisrhm.zendesk.com/api/v2/tickets.json", :http_basic_authentication=>['harris.rhm@gmail.com/token', '6GB65xsrJb4V7HevT3xlbZUyquFNZtUn4POBvenm']).read)
    end

    def transform
      results = []
      get_client["tickets"].each do |ticket|
        ticket_id = ticket["id"].to_i
        requester = ticket["requester_id"].to_i
        subject = ticket["subject"]
        description = ticket["description"]
        created_date = ticket["created_at"]
        created_time = ticket["created_at"]
        # created_date = ticket["created_at"].strftime("%d %B %Y")
        # created_time = ticket["created_at"].strftime("%H:%M%p")
        status = ticket["status"]
        results << Ticket.new(ticket_id: ticket_id, requester: requester, subject: subject, description: description, created_date: created_date, created_time: created_time, status: status)
      end
      return results
    end
end