class Scraper
    BASE_URL = "https://www.mobafire.com/league-of-legends/build/fundamentals-league-of-legends-new-player-beginner-guide-371292"

    def self.scrape
        opened_url = URI.open(BASE_URL)
        doc = Nokogiri::XML(opened_url)
        #binding.pry

    end 
end