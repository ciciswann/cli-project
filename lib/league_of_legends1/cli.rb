#require_relative '../environment.rb'
require 'tty-prompt'
#require 'figlet'

class CLI
    attr_reader :champions
    
    @@prompt = TTY::Prompt.new(active_color: :bright_yellow, symbols: {marker: "➤"})
    #@@font = Figlet::Font.new('chunky_bacon.txt')
    #@@figlet = Figlet::Typesetter.new(@@font)

    ## ASCII TEXT BANNERS ##

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

    █▀▀ █░█ ▄▀█ █▀▄▀█ █▀█ █ █▀█ █▄░█   █░░ █ █▀ ▀█▀
    █▄▄ █▀█ █▀█ █░▀░█ █▀▀ █ █▄█ █░▀█   █▄▄ █ ▄█ ░█░".colorize(:yellow)
    puts "    _.~'~._.~'~._.~'~._.~'~._.~'~._.~'~._.~'~._.~'~.\n\n"
    end

    #def overview_banner
    #end

    #def class_banner
    #end

    ## EXIT ##

    def self.exit
        system 'clear'
        puts "\n Thanks for using my program! \n"
        puts "\n"
        sleep 0.75
        system 'exit!'
    end

    ## MAIN PAGE ##

    def run
        system 'clear'
        API.new.call
        banner
        choices = ["Overview: What is League of Legends?", "Search by Name", "Search by Class", "Exit"]
        nav = @@prompt.select("Please select from the options below:\n", choices)
        if nav == "Overview: What is League of Legends?"
            # need to create method
            CLI.exit
        elsif nav == "Search by Name"
            champ_select
        elsif nav == "Search by Class"
            # need to create method
            CLI.exit
        elsif nav == "Exit"
            CLI.exit
        end
    end 

    #def list_champions
        #system 'clear'
        #Champion.all
        #list_banner
        #API.new.call
        #Champion.display_grid_of_champs
    #end

## CHAMPION SELECTION PAGE ##

    def champ_select
        system 'clear'
        list_banner
        #API.new.call
        @champions = Champion.sorted_champs
        @champ_names = Champion.sorted_champ_names
        nav = @@prompt.enum_select("Type the number corresponding to the champion you'd like to learn more about, then hit enter:", @champ_names, per_page: 20, show_help: :always)
        @champions.each do |champ|
            #binding.pry
            if nav == champ.name
                champ.display_champ_info
            end
        end
        champ_select_back
    end

    def champ_select_back
        choice = ["Back", "Exit"]
        back_nav = @@prompt.select("\n", choice)
        if back_nav == "Back"
            champ_select
        elsif "Exit"
            CLI.exit
        end
    end


    #def display_champ
        #puts @@figlet[champ_name]
        #self.display_champ_info
    #end

                                                                                                                                              
                                                                           
end

#CLI.new.run