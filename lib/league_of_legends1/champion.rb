using RubyFiglet

class Champion

    @@all = []

    def initialize(champ_hash)
        champ_hash.each do |key, value|
            self.class.attr_accessor key
            self.send("#{key}=", value)
        end
        save
    end
    
    def save
        self.class.all << self
    end

    def self.all
        @@all
    end

    def self.sorted_champ_names
        sorted_champs
        all.map(&:name)
    end

    def self.sorted_champs
        all.sort_by(&:name)
    end

    def display_stat_grid
        champ_table = TTY::Table.new(header: ["Stat", ""])
        stats.each do |k, v| 
            champ_table << ["#{k}", "#{v}"]
        end
        puts champ_table.render(:ascii)
    end

    def display_champ_info
        system 'clear'

        champ = "#{name}"
        champ.art!("fire_font-k")

        puts champ.colorize(:light_red)
        puts "#{title}".split.map(&:capitalize).join(' ')
        puts"\n"
        if champ_class.count == 2
            puts "Class: #{champ_class[0]}, #{champ_class[1]}"
            puts "\n"
        else 
            puts "Class: #{champ_class[0]}"
            puts "\n"
        end
        puts "Attack: #{info["attack"]}"
        puts "Defense: #{info["defense"]}"
        puts "Magic: #{info["magic"]}"
        puts "Difficulty: #{info["difficulty"]}"
        puts "\n"
        display_stat_grid
    end     

    
end



