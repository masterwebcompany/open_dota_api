require 'open_dota_api/entity'

module OpenDotaApi
  module Teams
    class Player < Entity
      define_adder(%w[account_id name games_played wins is_current_team_member])
    end
  end
end
