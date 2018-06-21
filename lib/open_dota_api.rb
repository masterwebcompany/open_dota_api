require 'open_dota_api/client'
require 'open_dota_api/version'

module OpenDotaApi
  extend SingleForwardable
  def_delegators :client, :leagues, :teams, :matches, :heroes, :pro_players, :explorer, :team, :player

  class << self
   attr_accessor :configuration
  end

 def self.configure
   self.configuration ||= Configuration.new
   yield(configuration)
 end

 class Configuration
   attr_accessor :api_key

   def initialize
     @api_key = ''
   end
 end
  def self.client
    @client ||= Client.new
  end
end
