class View
    def display_all(tickets)
      @answer = ""
      ask_user
      tickets.each do |ticket|
        puts "Ticket_ID: #{ticket.ticket_id} - Subject: #{ticket.subject} | Created_date: #{ticket.created_date} | Created_time: #{ticket.created_time} | Requested_by: #{ticket.requester}"
      end

      while @answer == "a" || @answer == "b" || @answer == "c" || @answer == "d"
        self.display_all(tickets)
        break 
      end
    end

    def display_one(tickets)
      puts "Please enter ticket_id to view or any key to main menu"
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

    def ask_user
      puts "Press 'a' | 'b' | 'c' | 'd' | any key to main menu"
      print "> "
      @answer = gets.chomp.to_s.downcase
    end
end