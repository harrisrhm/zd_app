require 'json'
require 'zendesk_api'

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
    @client
  end

end

zendesk_client = ZendeskService.new().get_client
# tickets = zendesk_client.tickets.page(1).per_page(25)
# next_page = tickets.next
tickets = zendesk_client.tickets.to_a
tickets.each do |ticket|
  ticket_id = ticket["id"]
  requester = ticket["requester_id"]
  subject = ticket["subject"]
  created_date = ticket["created_at"].strftime("%d %B %Y")
  created_time = ticket["created_at"].strftime("%H:%M%p")
  status = ticket["status"]
  # puts "Ticket_id: #{ticket["id"]}, Requester: #{ticket["requester_id"]}, Subject: #{ticket["subject"]}, Created: #{ticket["created_at"].strftime("%d %B %Y")} at #{ticket["created_at"].strftime("%H:%M%p")}, Status: #{ticket["status"]}"
end