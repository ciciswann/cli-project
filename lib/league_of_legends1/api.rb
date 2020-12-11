#require 'net/http'
#require 'httparty'
#require 'pry'

#require_relative "./champion"
require_relative '../environment.rb'

class API
    URL = "http://ddragon.leagueoflegends.com/cdn/10.24.1/data/en_US/champion.json"
    
    def call
        #uri = URI(URL)
        #response = Net::HTTP.get(uri)
        #formatted_resp = JSON.parse(response)
        response = HTTParty.get(URL)
        response["data"].values.each do |champ_hash|
            Champion.new({name: champ_hash["name"], title: champ_hash["title"], champ_class: champ_hash["tags"]})
        end
        #binding.pry
    end


end

#API.new.call