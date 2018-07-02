require 'open_dota_api/entity'

module OpenDotaApi
  module Matches
    class DraftTiming < Entity
      def order
        data['order']
      end

      def pick
        data['pick']
      end

      def active_team
        data['active_team']
      end

      def hero_id
        data['hero_id']
      end

      def player_slot
        data['player_slot']
      end

      def extra_time
        data['extra_time']
      end

      def total_time_taken
        data['total_time_taken']
      end
    end
  end
end
