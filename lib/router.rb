class Router
    def initialize(controller)
      @controller = controller
      @running    = true
    end
  
    def run
      puts "Welcome to the Zendesk Ticket Viewer!"
      puts "           --           "
  
      while @running
        display_tasks
        action = gets.chomp.to_i
        print `clear`
        route_action(action)
      end
    end
  
    private
  
    def route_action(action)
      case action
        when 1 then @controller.list
        when 2 then @controller.show
        when 3 then stop
      else
          puts "Please press 1, 2 or 3"
      end
    end
  
    def stop
      @running = false
    end
  
    def display_tasks
      puts ""
      puts "What would you like to do?"
      puts "1 - List all tickets"
      puts "2 - See individual ticket"
      puts "3 - Stop and exit the program"
      print "> "
    end
  end
  