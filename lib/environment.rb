require "httparty"
require "net/http"
require "pry"
require "open-uri"
require "colorize"
require "figlet"
require "tty-prompt"
require "tty-table"
require "nokogiri"
require "ruby_figlet"

require_relative "./league_of_legends1/version"
require_relative "./league_of_legends1/api"
require_relative "./league_of_legends1/cli"
require_relative "./league_of_legends1/champion"
require_relative "./league_of_legends1/overview"
require_relative "./league_of_legends1/scraper"

module LeagueOfLegends
  class Error < StandardError; end
  # Your code goes here...
end
