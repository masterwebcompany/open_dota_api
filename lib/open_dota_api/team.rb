require 'open_dota_api/entity'

module OpenDotaApi
  class Team < Entity
    ENDPOINT = 'teams'.freeze
    PLAYERS_ENDPOINT = 'players'.freeze
    MATCHES_ENDPOINT = 'matches'.freeze

    define_adder(%w[team_id rating wins losses last_match_time name tag])

    def players
      client.team_players(self)
    end

    def matches
      client.team_matches(self)
    end

    def players_endpoint
      "#{ENDPOINT}/#{data['team_id']}/#{PLAYERS_ENDPOINT}"
    end

    def matches_endpoint
      "#{ENDPOINT}/#{data['team_id']}/#{MATCHES_ENDPOINT}"
    end

    def self.show_endpoint(team_id)
      "#{ENDPOINT}/#{team_id}"
    end

    private
      def client
        @client ||= Client.new
      end
  end
end
