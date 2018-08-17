require 'open_dota_api/connection'
require 'open_dota_api/league'
require 'open_dota_api/team'
require 'open_dota_api/match'
require 'open_dota_api/hero'
require 'open_dota_api/pro_player'
require 'open_dota_api/explorer'
require 'open_dota_api/teams/player'
require 'open_dota_api/teams/match'
require 'open_dota_api/player'
require 'json'

module OpenDotaApi
  class Client
    INTERFACE = 'api'.freeze


    def leagues
      leagues_data = request(League::ENDPOINT)
      return {} unless leagues_data.success?
      League.instantiate(leagues_data)
    end

    def teams
      teams_data = request(Team::ENDPOINT)
      return {} unless teams_data.success?
      Team.instantiate(teams_data)
    end

    def heroes
      heroes_data = request(Hero::ENDPOINT)
      return {} unless heroes_data.success?
      Hero.instantiate(heroes_data)
    end

    def pro_players
      pro_players_data = request(ProPlayer::ENDPOINT)
      return {} unless pro_players_data
      ProPlayer.instantiate(pro_players_data)
    end

    def explorer(league_id = nil)
      explorer_data = request(Explorer::ENDPOINT, query_params: Explorer.query_params(league_id))
      return {} unless explorer_data.success?
      Explorer.new(explorer_data)
    end

    def match_by_id(match_id)
      return unless match_id

      match_data = request(Match::ENDPOINT, match_id)
      return Match.new(match_data) if match_data.success? && match_data['chat'] && match_data['teamfights'] && match_data['radiant_gold_adv'] && match_data['radiant_xp_adv']
      response = JSON.parse(post_request(Match::REQUEST_ENDPOINT, match_id).body)
      job_id = response.dig('job', 'jobId')
      return unless job_id
      8.times do
        job = request(Match::REQUEST_ENDPOINT, job_id).body
        puts job
        break if job == Match::JOB_NULL_RESPONSE
        sleep 10
      end
      match_data = request(Match::ENDPOINT, match_id)
      return Match.new({}) unless match_data.success?
      Match.new(match_data)
    end

    def team_by_id(team_id)
      return {} unless team_id

      team_data = request(Team.show_endpoint(team_id))
      return {} unless team_data
      Team.new(team_data)
    end

    def player_by_id(player_id)
      return {} unless player_id

      player_data = request(Player.show_endpoint(player_id))
      return {} unless player_data
      Player.new(player_data)
    end

    def players_by_team_id(team_id)
      return {} unless team_id

      players_data = request(Team.players_endpoint(team_id))
      return {} unless players_data
      Teams::Player.instantiate(players_data)
    end

    def matches_by_team_id(team_id)
      return {} unless team_id

      matches_data = request(Team.matches_endpoint(team_id))
      return {} unless matches_data
      Teams::Match.instantiate(matches_data)
    end

    private

    def connection
      @connection ||= Connection.new
    end

    def request(method, argument = nil, query_params: nil)
      argument = argument ? argument.to_s.concat('/') : nil
      pathname = "/#{INTERFACE}/#{method}/#{argument}"
      connection.get(pathname, query: query_params)
    end

    def post_request(method, argument = nil, query_params: nil)
      argument = argument ? argument.to_s.concat('/') : nil
      pathname = "/#{INTERFACE}/#{method}/#{argument}"
      connection.post(pathname, query: query_params)
    end
  end
end
