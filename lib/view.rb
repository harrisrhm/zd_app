class View
    def display_all(tickets)
      tickets.each do |ticket|
        puts "Ticket_ID: #{ticket.ticket_id} - Subject: #{ticket.subject} | Created_date: #{ticket.created_date} | Created_time: #{ticket.created_time} | Requested_by: #{ticket.requester}"
      end
    end

    def display_one(tickets)
      one_ticket = ask_user_for_ticket_id
      tickets.each do |ticket|
        if one_ticket == ticket.ticket_id
          puts "Ticket_ID: #{ticket.ticket_id} - Subject: #{ticket.subject}"
          puts "" 
          puts "Description: #{ticket.description}" 
          puts ""
          puts "Status: #{ticket.status}"
          puts ""
          puts "Requested_by: #{ticket.requester}"
        else 
          "ticket is not valid"
        end
      end
    end

    def ask_user_for_ticket_id
      puts "Please enter Ticket_ID to view?"
      print "> "
      return gets.chomp.to_i
    end
end