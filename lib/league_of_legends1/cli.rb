require 'tty-prompt'
require 'colorize'

class CLI

    @@prompt = TTY::Prompt.new(active_color: :bold)

    ## MAIN PAGE ASCII BANNER ##

    def self.banner
        puts "
        
    ██╗     ███████╗ █████╗  ██████╗ ██╗   ██╗███████╗     ██████╗ ███████╗    
    ██║     ██╔════╝██╔══██╗██╔════╝ ██║   ██║██╔════╝    ██╔═══██╗██╔════╝    
    ██║     █████╗  ███████║██║  ███╗██║   ██║█████╗      ██║   ██║█████╗      
    ██║     ██╔══╝  ██╔══██║██║   ██║██║   ██║██╔══╝      ██║   ██║██╔══╝      
    ███████╗███████╗██║  ██║╚██████╔╝╚██████╔╝███████╗    ╚██████╔╝██║         
    ╚══════╝╚══════╝╚═╝  ╚═╝ ╚═════╝  ╚═════╝ ╚══════╝     ╚═════╝ ╚═╝         
    ██╗     ███████╗ ██████╗ ███████╗███╗   ██╗██████╗ ███████╗                
    ██║     ██╔════╝██╔════╝ ██╔════╝████╗  ██║██╔══██╗██╔════╝                
    ██║     █████╗  ██║  ███╗█████╗  ██╔██╗ ██║██║  ██║███████╗                
    ██║     ██╔══╝  ██║   ██║██╔══╝  ██║╚██╗██║██║  ██║╚════██║                
    ███████╗███████╗╚██████╔╝███████╗██║ ╚████║██████╔╝███████║                
    ╚══════╝╚══════╝ ╚═════╝ ╚══════╝╚═╝  ╚═══╝╚═════╝ ╚══════╝".colorize(:yellow)   
        puts "  
    █▀▀ █░█ ▄▀█ █▀▄▀█ █▀█ █ █▀█ █▄░█   █▀▀ ▄▀█ ▀█▀ ▄▀█ █░░ █▀█ █▀▀ █░█ █▀▀
    █▄▄ █▀█ █▀█ █░▀░█ █▀▀ █ █▄█ █░▀█   █▄▄ █▀█ ░█░ █▀█ █▄▄ █▄█ █▄█ █▄█ ██▄\n\n".colorize(:white)

    end

    ## EXIT ##

    def self.exit
        puts "\n Thanks for using my program! \n"
        sleep 0.75
        system 'exit!'
    end

    ## MAIN PAGE ##

    def self.main_page
        system 'clear'
        self.banner
        choices = ["Overview: What is League of Legends?", "Search by Name", "Search by Class", "Exit"]
        nav = @@prompt.select("Please select from the options below:\n", choices)
        if nav == "Overview: What is League of Legends?"
            # need to create class method
            CLI.exit
        elsif nav == "Search by Name"
            # need to create class method
            CLI.exit
        elsif nav == "Search by Class"
            # need to create class method
            CLI.exit
        elsif nav == "Exit"
            CLI.exit
        end
    end 
                                                                                                                                              
                                                                           
end

CLI.main_page