class View
    def display_all(tickets)
      tickets.each do |ticket|
        puts "Ticket_ID: #{ticket.ticket_id} - Subject: #{ticket.subject} | Created_date: #{ticket.created_date} | Created_time: #{ticket.created_time} | Requested_by: #{ticket.requester}"
      end

      # next_page = "n" 
      # puts "Press 'N' for next page"
      # print "> "
      # show_page = gets.chomp.to_s.downcase

      # while next_page == show_page
      #   tickets.each do |ticket|
      #     puts "Ticket_ID: #{ticket.ticket_id} - Subject: #{ticket.subject} | Created_date: #{ticket.created_date} | Created_time: #{ticket.created_time} | Requested_by: #{ticket.requester}"
      #   end
      # end
    end

    def display_one(tickets)
      puts "Please enter Ticket_ID to view?"
      print "> "
      one_ticket = gets.chomp.to_i

      tickets.each do |ticket|
        if one_ticket == ticket.ticket_id
          puts "Ticket_ID: #{ticket.ticket_id} - Subject: #{ticket.subject}"
          puts "" 
          puts "Description: #{ticket.description}" 
          puts ""
          puts "Status: #{ticket.status}"
          puts ""
          puts "Requested_by: #{ticket.requester}"
        end
      end
    end
end