class View
    def display_all(tickets)
      tickets.each do |ticket|
        puts "Ticket_ID: #{ticket.ticket_id} - Subject: #{ticket.subject} | Created_date: #{ticket.created_date} | Created_time: #{ticket.created_time} | Requested_by: #{ticket.requester}"
      end rescue puts "Please select from menu"

      @answer = ""

      while @answer == "a" || @answer == "b" || @answer == "c" || @answer == "d"
        self.display_all(tickets)
      end
    end

    def display_one(tickets)
      ask_user_for_id
      puts "Invalid ticket" if @one_ticket != 1...100

      tickets.each do |ticket|
        if @one_ticket == ticket.ticket_id
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

    def ask_user_for_id
      puts "Please enter ticket_id to view or any key to main menu"
      print "> "
      @one_ticket = gets.chomp.to_i
    end
end