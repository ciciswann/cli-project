class Scraper

    BASE_URL = "https://en.wikipedia.org/wiki/League_of_Legends"

    def self.scrape_overview
        opened_url = URI.open(BASE_URL)
        doc = Nokogiri::HTML(opened_url)
        doc.css("div.mw-parser-output p")[1,2].text
    end 

end