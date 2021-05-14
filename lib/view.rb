class View
    def display(tickets)
      tickets.each_with_index do |ticket, index|
        puts "#{index + 1}. #{ticket.ticket_id}: #{ticket.subject} (#{ticket.requester})"
      end
    end
end