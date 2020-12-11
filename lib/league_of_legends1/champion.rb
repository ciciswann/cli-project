require_relative '../environment.rb'
require 'figlet'
require 'artii'
require 'AsciiGenerator'
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
        all.sort_by(&:name)
        all.map(&:name)
    end

    def self.sorted_champs
        all.sort_by(&:name)
    end

    def self.display_grid_of_champs
        #API.new.call
        champ_table = TTY::Table.new(header: ["Id", "Name"])
        sorted_champs.each.with_index(1) do |champ, i| 
            champ_table << ["#{i}".red, "#{champ.name}"]
        end
        puts champ_table.render(:unicode)
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
        puts"\n"
        puts "Title: #{title.capitalize}"
        if champ_class.count == 2
            puts "Class: #{champ_class[0]}, #{champ_class[1]}\n"
        else 
            puts "Class: #{champ_class[0]}\n"
        end
    end     

    
end

#binding.pry

