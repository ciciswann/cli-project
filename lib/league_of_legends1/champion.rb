#require_relative '../environment.rb'
#require 'figlet'
#require 'artii'
#require 'AsciiGenerator'
require 'ruby_figlet'
using RubyFiglet


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

    def self.sorted_champ_names
        sorted_champs
        all.map(&:name)
    end

    def self.sorted_champs
        all.sort_by(&:name)
    end

    def display_stat_grid
        #API.new.call
        champ_table = TTY::Table.new(header: ["Stat", ""])
        stats.each do |k, v| 
            champ_table << ["#{k}", "#{v}"]
        end
        puts champ_table.render(:ascii)
    end

    def display_champ_info
        #font = Figlet::Font.new('big.flf')
        #figlet = Figlet::Typesetter.new(font)
        #font = Artii::Base.new :font => 'cybermedium'

        #puts figlet["#{name}"]
        system 'clear'
        #binding.pry
        champ = "#{name}"
        champ.art!("cybermedium")

        puts champ.colorize(:yellow)
        puts "#{title}".split.map(&:capitalize).join(' ')
        puts"\n"
        if champ_class.count == 2
            puts "Class: #{champ_class[0]}, #{champ_class[1]}"
            puts "\n"
        else 
            puts "Class: #{champ_class[0]}"
            puts "\n"
        end
        display_stat_grid
    end     

    
end

#binding.pry

