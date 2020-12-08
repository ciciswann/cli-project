class API
    URL = "http://ddragon.leagueoflegends.com/cdn/10.24.1/data/en_US/champion.json"
    
    def call
        uri = URI(URL)
        response = Net::HTTP.get(uri)
        formatted_resp = JSON.parse(response)
        binding.pry
    end


end