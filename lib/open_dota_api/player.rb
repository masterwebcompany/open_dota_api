require 'open_dota_api/entity'

module OpenDotaApi
  class Player < Entity
    ENDPOINT = 'players'.freeze

    def self.show_endpoint(player_id)
      "#{ENDPOINT}/#{player_id}"
    end

    private
      def client
        @client ||= Client.new
      end
  end
end
