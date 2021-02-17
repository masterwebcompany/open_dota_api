require 'open_dota_api/entity'
require 'open_dota_api/matches/player'
require 'open_dota_api/matches/objective'
require 'open_dota_api/matches/draft_timing'
require 'httparty'

module OpenDotaApi
  class Match < Entity
    ENDPOINT = 'matches'.freeze
    REQUEST_ENDPOINT = 'request'.freeze
    LOBBY_TYPES_URL = 'https://raw.githubusercontent.com/odota/dotaconstants/master/build/lobby_type.json'

    LOBBY_TYPES_NAMES = {
      normal:         'lobby_type_normal',
      practice:       'lobby_type_practice',
      tournament:     'lobby_type_tournament',
      tutorial:       'lobby_type_tutorial',
      coop_bots:      'lobby_type_coop_bots',
      ranked_team_mm: 'lobby_type_ranked_team_mm',
      ranked_solo_mm: 'lobby_type_ranked_solo_mm',
      ranked:         'lobby_type_ranked',
      '1v1_mid':      'lobby_type_1v1_mid',
      battle_cup:     'lobby_type_battle_cup',
    }

    def self.instantiate(_ = nil)
      raise NotImplementedError
    end

    # @param [Symbol] lobby_type_name
    def self.lobby_type_id(lobby_type_name)
      lobby_types_response = HTTParty.get(LOBBY_TYPES_URL)
      lobby_types_ids = JSON.parse(lobby_types_response)

      type = lobby_types_ids.find do |_id, obj|
        obj['name'] == LOBBY_TYPES_NAMES[lobby_type_name]
      end

      type&.first
    end

    def match_id
      data['match_id']
    end

    def start_time
      data['start_time']
    end

    def duration
      data['duration']
    end

    def series_id
      data['series_id']
    end

    def engine
      data['engine']
    end

    def game_mode
      data['game_mode']
    end

    def series_type
      data['series_type']
    end

    def radiant_team_id
      data['radiant_team_id']
    end

    def radiant_team
      data['radiant_team']
    end


    def dire_team_id
      data['dire_team_id']
    end

    def dire_team
      data['dire_team']
    end

    def match_seq_num
      data['match_seq_num']
    end

    def league_id
      data['leagueid']
    end

    def first_blood_time
      data['first_blood_time']
    end

    def winner
      data['radiant_win'] ? :radiant : :dire
    end

    def cluster
      data['cluster']
    end

    def replay_salt
      data['replay_salt']
    end

    def version
      data['version']
    end

    def replay_url
      "http://replay#{cluster}.valve.net/570/#{match_id}_#{replay_salt}.dem.bz2"
    end

    def region
      data['region']
    end

    def patch
      data['patch']
    end

    def radiant_score
      data['radiant_score']
    end

    def dire_score
      data['dire_score']
    end

    def radiant_gold_advantage
      data['radiant_gold_adv']
    end

    def radiant_xp_advantage
      data['radiant_xp_adv']
    end

    def players
      data['players'] ? Player.instantiate(data['players']) : []
    end

    def objectives
      data['objectives'] ? Matches::Objective.instantiate(data['objectives']) : []
    end

    def draft_timings
      data['draft_timings'] ? Matches::DraftTiming.instantiate(data['draft_timings']) : []
    end

    def self.request_endpoint(id)
      "/#{REQUEST_ENDPOINT}/#{id}"
    end

    class Player < Matches::Player; end
  end
end
