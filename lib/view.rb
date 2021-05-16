class View
    def display_all(tickets)
      puts "-------------------------------------------------------"
      tickets.each do |ticket|
        puts ""
        puts "Ticket_id: #{ticket.ticket_id} - Subject: #{ticket.subject} | Submitted_date: #{ticket.created_date} | Requested_by: #{ticket.requester}"
        puts ""
      end rescue puts "Please select from menu"
      puts "-------------------------------------------------------"

      @answer = ""

      while @answer == "a" || @answer == "b" || @answer == "c" || @answer == "d"
        self.display_all(tickets)
      end
    end

    def display_one(tickets)
      ask_user_for_id
      puts "Invalid ticket" if @one_ticket > tickets.size # ticket is invalid if id is not exist from api

      tickets.each do |ticket|
        if @one_ticket == ticket.ticket_id && @one_ticket <= tickets.size
          puts "------------------------------------------------------------"
          puts ""
          puts "Ticket_id: #{ticket.ticket_id} - Subject: #{ticket.subject}"
          puts "" 
          puts "Description: #{ticket.description}" 
          puts ""
          puts "Status: #{ticket.status}"
          puts ""
          puts "Requested_by: #{ticket.requester}"
          puts ""
          puts "Submmited_date: #{ticket.created_date} at #{ticket.created_time}"
          puts ""
          puts "------------------------------------------------------------"
        end
      end
    end

    def ask_user
      puts "Press 'a' | 'b' | 'c' | 'd' | or any key to main menu"
      print "> "
      @answer = gets.chomp.to_s.downcase
    end

    def ask_user_for_id
      puts "Please enter ticket_id to view or any key to main menu"
      print "> "
      @one_ticket = gets.chomp.to_i
    end
end