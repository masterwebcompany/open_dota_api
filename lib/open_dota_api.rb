require 'open_dota_api/client'
require 'open_dota_api/version'

module OpenDotaApi
  extend SingleForwardable

  def_delegators :client,
                 :leagues,
                 :teams,
                 :heroes,
                 :pro_players,
                 :explorer,
                 :team_by_id,
                 :player_by_id,
                 :match_by_id,
                 :players_by_team_id,
                 :matches_by_team_id,
                 :heroes_by_team_id,
                 :heroes_by_player_id

  class << self
   attr_accessor :configuration
  end

 def self.configure
   self.configuration ||= Configuration.new
   yield(configuration)
 end

 class Configuration
   attr_accessor :api_key, :base_uri

   def initialize
     @api_key = ''
     @base_uri = 'api.opendota.com'
   end

   def base_uri=(uri)
     @base_uri = uri
     OpenDotaApi::Connection.base_uri(uri)
   end
 end

  def self.client
    @client ||= Client.new
  end
end
