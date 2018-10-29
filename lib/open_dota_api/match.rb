require 'open_dota_api/entity'
require 'open_dota_api/matches/player'
require 'open_dota_api/matches/objective'
require 'open_dota_api/matches/draft_timing'

module OpenDotaApi
  class Match < Entity
    ENDPOINT = 'matches'.freeze
    REQUEST_ENDPOINT = 'request'.freeze

    def self.instantiate(_ = nil)
      raise NotImplementedError
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
