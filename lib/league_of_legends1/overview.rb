class Overview

    def self.print_overview
        intro = Scraper.scrape_overview
        line_width = 90
        break_sequence = "\n"
        intro.split("\n").collect! do |line|
            if line.length > line_width 
                puts line.gsub(/(.{1,#{line_width}})(\s+|$)/, "\\1#{break_sequence}").rstrip
                puts break_sequence
            else
                puts line
                puts break_sequence
            end    
        end * break_sequence
    end

end