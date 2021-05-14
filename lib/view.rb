class View
    def display(tickets)
      tickets.each do |ticket|
        puts "Ticket_ID: #{ticket.ticket_id} - Subject: #{ticket.subject} Created_date: #{ticket.created_date} Created_time: #{ticket.created_time} Requested_by: #{ticket.requester}"
      end
    end
end