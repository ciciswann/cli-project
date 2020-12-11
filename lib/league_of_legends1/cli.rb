require 'tty-prompt'
require 'colorize'

class CLI
    attr_reader :champions
    
    @@prompt = TTY::Prompt.new(active_color: :bold)

    ## MAIN PAGE ASCII BANNER ##

    def banner
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

    def run
        system 'clear'
        banner
        #@champions = API.call
        choices = ["Overview: What is League of Legends?", "Search by Name", "Search by Class", "Exit"]
        nav = @@prompt.select("Please select from the options below:\n", choices)
        if nav == "Overview: What is League of Legends?"
            # need to create class method
            CLI.exit
        elsif nav == "Search by Name"
            list_champions
        elsif nav == "Search by Class"
            # need to create class method
            CLI.exit
        elsif nav == "Exit"
            CLI.exit
        end
    end 

    def list_champions
        #system 'clear'
        Champion.all
        #Champion.display_grid_of_champs
    end
                                                                                                                                              
                                                                           
end

CLI.new.run