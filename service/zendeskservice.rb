require "json"
require "open-uri"
require "will_paginate/array"
require_relative "../lib/ticket"
require_relative "../lib/view"

class ZendeskService
    def get_client
      url = "https://harrisrhm.zendesk.com/api/v2/tickets.json"
      clients_hash = JSON.parse(open(url, :http_basic_authentication=>['harris.rhm@gmail.com/token', '6GB65xsrJb4V7HevT3xlbZUyquFNZtUn4POBvenm']).read)
    end

    def transform
      results = []
      get_client["tickets"].each do |ticket|
        ticket_id = ticket["id"]
        requester = ticket["requester_id"]
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

    def paginate
        first_tab = "a"
        second_tab = "b"
        third_tab = "c"
        fourth_tab = "d"
        user_response = View.new().ask_user

        if first_tab == user_response
          paginated_one = transform.paginate(:page => 1, :per_page => 25)
        elsif second_tab == user_response
          paginated_two = transform.paginate(:page => 2, :per_page => 25)
        elsif third_tab == user_response
          paginated_three = transform.paginate(:page => 3, :per_page => 25)
        elsif fourth_tab == user_response
          paginated_three = transform.paginate(:page => 4, :per_page => 25)
        end
    end
end