require 'open_dota_api/entity'

module OpenDotaApi
  module Matches
    class Player < Entity
      def match_id
        data['match_id']
      end

      def player_slot
        data['player_slot']
      end

      def account_id
        data['account_id']
      end

      def assists
        data['assists']
      end

      def camps_stacked
        data['camps_stacked']
      end

      def creeps_stacked
        data['creeps_stacked']
      end

      def deaths
        data['deaths']
      end

      def denies
        data['denies']
      end

      def gold_per_min
        data['gold_per_min']
      end

      def hero_id
        data['hero_id']
      end

      def kills
        data['kills']
      end

      def obs_placed
        data['obs_placed']
      end

      def sen_placed
        data['sen_placed']
      end

      def rune_pickups
        data['rune_pickups']
      end

      def stuns
        data['stuns']
      end

      def xp_per_min
        data['xp_per_min']
      end

      def name
        data['name']
      end

      def side
        data['isRadiant'] ? :radiant : :dire
      end

      def kda
        data['kda']
      end

      def tower_kills
        data['tower_kills']
      end

      def roshan_kills
        data['roshan_kills']
      end

      def hero_healing
        data['hero_healing']
      end

      def last_hits
        data['last_hits']
      end

      def firstblood_claimed
        data['firstblood_claimed']
      end

      def hero_damage
        data['hero_damage']
      end

      def teamfight_participation
        data['teamfight_participation']
      end

      def level
        data['level']
      end

      def kills_per_min
        data['kills_per_min']
      end

      def tower_damage
        data['tower_damage']
      end

      def towers_killed
        data['towers_killed']
      end

      def total_gold
        data['total_gold']
      end

      def total_xp
        data['total_xp']
      end

      def courier_kills
        data['courier_kills']
      end

      def lane_efficiency
        data['lane_efficiency']
      end

      def lane_role
        data['lane_role']
      end

      def lane
        data['lane']
      end
    end
  end
end
