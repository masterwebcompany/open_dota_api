require 'open_dota_api/entity'

module OpenDotaApi
  module Players
    class Hero < Entity
      define_adder(%w[
        against_games
        last_played
        against_win
        with_games
        with_win
        hero_id
        games
        win
      ])
    end
  end
end
