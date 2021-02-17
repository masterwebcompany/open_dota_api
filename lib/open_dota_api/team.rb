require 'open_dota_api/entity'

module OpenDotaApi
  class Team < Entity
    ENDPOINT = 'teams'.freeze
    PLAYERS_ENDPOINT = 'players'.freeze
    MATCHES_ENDPOINT = 'matches'.freeze

    define_adder(%w[team_id rating wins losses last_match_time name tag logo_url])

    def players
        client.players_by_team_id(self.team_id)
    end

    def matches
      client.matches_by_team_id(self.team_id)
    end

    def self.players_endpoint(team_id)
      "#{ENDPOINT}/#{team_id}/#{PLAYERS_ENDPOINT}"
    end

    def self.matches_endpoint(team_id)
      "#{ENDPOINT}/#{team_id}/#{MATCHES_ENDPOINT}"
    end

    def self.show_endpoint(team_id)
      "#{ENDPOINT}/#{team_id}"
    end

    def self.heroes_endpoint(team_id)
      [ENDPOINT, team_id, Hero::ENDPOINT].join('/')
    end

    private
      def client
        @client ||= Client.new
      end
  end
end
