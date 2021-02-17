require 'open_dota_api/entity'

module OpenDotaApi
  module Teams
    class Hero < Entity
      define_adder(%w[
        games_played
        hero_id
        name
        wins
      ])
    end
  end
end
