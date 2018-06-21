require 'open_dota_api/entity'

module OpenDotaApi
  module Teams
    class Match < Entity
      define_adder (%w(match_id radiant_win radiant duration start_time league_name cluster opposing_team_id opposing_team_name opposing_team_logo))

      def league_id
        data['leagueid']
      end
    end
  end
end
