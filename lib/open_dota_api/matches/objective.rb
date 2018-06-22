require 'open_dota_api/entity'

module OpenDotaApi
  module Matches
    class Objective < Entity
      def time
        data['time']
      end

      def type
        data['type']
      end

      def unit
        data['unit']
      end

      def key
        data['key']
      end

      def slot
        data['slot']
      end

      def player_slot
        data['player_slot']
      end
    end
  end
end
