require "json"
require "zendesk_api"
require_relative "../lib/ticket"


class ZendeskService
    def initialize
      @client = ZendeskAPI::Client.new do |config|
      config.url = "https://harrisrhm.zendesk.com/api/v2"
      config.username = "harris.rhm@gmail.com"
      config.token = "6GB65xsrJb4V7HevT3xlbZUyquFNZtUn4POBvenm"
      # Optional:
      config.retry = true
      require 'logger'
      config.logger = Logger.new(STDOUT)
      end
    end

    def get_client
      results = []
      tickets = @client.tickets.to_a
      tickets.each do |ticket|
        ticket_id = ticket["id"]
        requester = ticket["requester_id"]
        subject = ticket["subject"]
        description = ticket["description"]
        created_date = ticket["created_at"].strftime("%d %B %Y")
        created_time = ticket["created_at"].strftime("%H:%M%p")
        status = ticket["status"]
        results << Ticket.new(ticket_id: ticket_id, requester: requester, subject: subject, description: description, created_date: created_date, created_time: created_time, status: status)
      end
      return results
    end
end


new = ZendeskService.new
main = new.get_client
puts main