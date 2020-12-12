
class CLI

    attr_reader :champions, :champ_names
    
    @@prompt = TTY::Prompt.new(active_color: :bright_yellow, symbols: {marker: ">"}, interrupt: :exit)
    
    def initialize
        API.new.call
    end

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
    ╚══════╝╚══════╝ ╚═════╝ ╚══════╝╚═╝  ╚═══╝╚═════╝ ╚══════╝".colorize(:light_yellow)   
        puts "  
    █▀▀ █░█ ▄▀█ █▀▄▀█ █▀█ █ █▀█ █▄░█   █▀▀ ▄▀█ ▀█▀ ▄▀█ █░░ █▀█ █▀▀ █░█ █▀▀
    █▄▄ █▀█ █▀█ █░▀░█ █▀▀ █ █▄█ █░▀█   █▄▄ █▀█ ░█░ █▀█ █▄▄ █▄█ █▄█ █▄█ ██▄\n\n".colorize(:light_white)

    end

    def list_banner
        puts "

    █▀▀ █░█ ▄▀█ █▀▄▀█ █▀█ █ █▀█ █▄░█   █░░ █ █▀ ▀█▀
    █▄▄ █▀█ █▀█ █░▀░█ █▀▀ █ █▄█ █░▀█   █▄▄ █ ▄█ ░█░".colorize(:light_yellow)
    puts "    _.~'~._.~'~._.~'~._.~'~._.~'~._.~'~._.~'~._.~'~.\n\n"
    end

    def overview_banner
        puts "

    ▄▀█ █▄▄ █▀█ █░█ ▀█▀   █░░ █▀█ █░░
    █▀█ █▄█ █▄█ █▄█ ░█░   █▄▄ █▄█ █▄▄".colorize(:yellow)
        puts "    _.~'~._.~'~._.~'~._.~'~._.~'~._.~'\n\n"
    
    end

    ## EXIT ##

    def self.exit
        clear
        puts "\n Thanks for using my program! \n"
        puts "\n"
        sleep 0.75
        system 'exit!'
    end

    ## SYSTEM CLEAR ##

    def self.clear
        system 'clear'
    end

    ## BACK to MAIN PAGE or EXIT OPTION ##

    def back_main
        choice = ["Back to Main", "Exit"]
        back_nav = @@prompt.select("\n", choice)
        if back_nav == "Back to Main"
            run
        elsif "Exit"
            CLI.exit
        end
    end

    ## MAIN MENU ##

    def run
        CLI.clear
        #API.new.call - can't put API call in run method, it will call everytime you go back to "Main"
        banner
        choices = ["Overview: What is League of Legends?", "Search by Champion Name", "Exit"]
        nav = @@prompt.select("Please select from the options below:\n", choices)
        if nav == "Overview: What is League of Legends?"
            about_lol
        elsif nav == "Search by Champion Name"
            champ_select
        #elsif nav == "Search by Class" - additional feature I'd like to add if there's more time
            # need to create method 
            #CLI.exit
        elsif nav == "Exit"
            CLI.exit
        end
    end 

    ## CHAMPION SELECTION MENU ##

    def champ_select
        CLI.clear
        list_banner
        #API.new.call
        @champions = Champion.sorted_champs
        @champ_names = Champion.sorted_champ_names
        nav = @@prompt.enum_select("Type the number corresponding to the champion you'd like to learn more about, then hit Enter:", @champ_names, per_page: 20)
        @champions.each do |champ|
            #binding.pry
            if nav == champ.name
                champ.display_champ_info
            end
        end
        champ_select_back
    end

    def champ_select_back
        choice = ["Back to Champion List", "Back to Main", "Exit"]
        back_nav = @@prompt.select("\n", choice)
        if back_nav == "Back to Champion List"
            champ_select
        elsif back_nav == "Back to Main"
            self.run
        elsif "Exit"
            CLI.exit
        end
    end

    ## ABOUT LEAGUE OVERVIEW ##

    def about_lol
        CLI.clear
        overview_banner
        Overview.print_overview
        back_main
    end                                                                                                                           
                                                                           
end