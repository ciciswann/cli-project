require_relative '../environment.rb'
require 'tty-prompt'

class CLI
    #attr_reader :champions
    
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
    █▄▄ █▀█ █▀█ █░▀░█ █▀▀ █ █▄█ █░▀█   █▄▄ █▀█ ░█░ █▀█ █▄▄ █▄█ █▄█ █▄█ ██▄\n\n"

    end

    def list_banner
        puts "
        .d88b 8                         w                8    w       w   
        8P    8d8b. .d88 8d8b.d8b. 88b. w .d8b. 8d8b.    8    w d88b w8ww 
        8b    8P Y8 8  8 8P Y8P Y8 8  8 8 8' .8 8P Y8    8    8 `Yb.  8   
        `Y88P 8   8 `Y88 8   8   8 88P' 8 `Y8P' 8   8    8888 8 Y88P  Y8P 
                                   8                                      \n".colorize(:yellow)
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
        choices = ["Overview: What is League of Legends?", "Search by Name", "Search by Class", "Exit"]
        nav = @@prompt.select("Please select from the options below:\n", choices)
        if nav == "Overview: What is League of Legends?"
            # need to create class method
            CLI.exit
        elsif nav == "Search by Name"
            champ_select
        elsif nav == "Search by Class"
            # need to create class method
            CLI.exit
        elsif nav == "Exit"
            CLI.exit
        end
    end 

    def list_champions
        #system 'clear'
        #Champion.all
        #list_banner
        API.new.call
        Champion.display_grid_of_champs
    end

    def champ_select
        system 'clear'
        list_banner
        @@prompt.enum_select("Select a champion:\n", list_champions)
    end

                                                                                                                                              
                                                                           
end

#CLI.new.run