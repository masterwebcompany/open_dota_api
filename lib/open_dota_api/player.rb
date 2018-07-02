require 'open_dota_api/entity'

module OpenDotaApi
  class Player < Entity
    ENDPOINT = 'players'.freeze

    # TODO getters
  
    def self.show_endpoint(player_id)
      "#{ENDPOINT}/#{player_id}"
    end
  end
end
