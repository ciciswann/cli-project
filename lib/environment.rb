require_relative "./league_of_legends1/version"
require_relative "./league_of_legends1/api"
require_relative "./league_of_legends1/cli"
require_relative "./league_of_legends1/champion"

require "httparty"
require "net/http"
require "pry"

module LeagueOfLegends
  class Error < StandardError; end
  # Your code goes here...
end
