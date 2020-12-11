require 'pry'
require 'tty-table'
class Champion
    #attr_accessor :name, :title, :stats, :tags
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

    def self.sorted_champs
        binding.pry
        all.sort_by(&:name)
    end

    def self.display_grid_of_champs
        champ_table = TTY::Table.new(header: ["Id", "Name"])
        sorted_champs.each.with_index(1) do |champ, i| 
            champ_table << ["#{i}".red, "#{champ.name}"]
        end
        #binding.pry
        puts champ_table.render(:unicode)
    end
    
end

binding.pry

