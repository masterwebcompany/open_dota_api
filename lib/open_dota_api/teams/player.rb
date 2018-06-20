require 'open_dota_api/entity'

module OpenDotaApi
  module Teams
    class Player < Entity
      def account_id
        data['account_id']
      end

      def name
        data['name']
      end

      def games_played
        data['games_played']
      end

      def wins
        data['wins']
      end

      def is_current_team_member
        data['is_current_team_member']
      end
    end
  end
end
