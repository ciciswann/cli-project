class API
    URL = "http://ddragon.leagueoflegends.com/cdn/10.24.1/data/en_US/champion.json"
    
    def call
        response = HTTParty.get(URL)
        response["data"].values.each do |champ_hash|
            #binding.pry
            Champion.new({name: champ_hash["name"], title: champ_hash["title"], champ_class: champ_hash["tags"], info: champ_hash["info"], stats: champ_hash["stats"]})
        end
    end


end

