# [![odra](https://user-images.githubusercontent.com/2478436/28491007-95355790-6ef0-11e7-95b9-a08f585db9e8.png)](https://rubygems.org/gems/open_dota_api)

###

:gem: Unofficial Ruby Gem for [OpenDotaAPI](https://docs.opendota.com/). This API provides Dota 2 related data.

<!-- ### -->
<!-- [![Gem Version](https://badge.fury.io/rb/open_dota_api.svg)](https://badge.fury.io/rb/open_dota_api)
[![Build Status](https://travis-ci.org/vergilet/open_dota_api.svg?branch=master)](https://travis-ci.org/vergilet/open_dota_api)
[![Code Climate](https://codeclimate.com/github/vergilet/open_dota_api/badges/gpa.svg)](https://codeclimate.com/github/vergilet/open_dota_api)
[![Test Coverage](https://codeclimate.com/github/vergilet/open_dota_api/badges/coverage.svg)](https://codeclimate.com/github/vergilet/open_dota_api/coverage)
[![Dependency Status](https://www.versioneye.com/user/projects/59a3b1540fb24f002b6205ef/badge.svg?style=flat)](https://www.versioneye.com/user/projects/59a3b1540fb24f002b6205ef) -->
<!--[![Dependency Status](https://gemnasium.com/badges/github.com/vergilet/open_dota_api.svg)](https://gemnasium.com/github.com/vergilet/open_dota_api) -->

###
> :warning: Please keep request rate to approximately 3/s.

## Installation
If you use Rubygems you can type:

```ruby
gem install open_dota_api
```

or add this line to your application's Gemfile:

```ruby
gem 'open_dota_api', github: 'webmil/open_dota_api'
```

then execute:
```
$ bundle
```

## Using

To use OpenDotaApi you can:

```ruby

require 'open_dota_api'

```

Api key configuration:

```ruby

# config/initializers/open_dota_api.rb

OpenDotaApi.configure do |c|
  #c.api_key = 'your-api-key'
end

```

Use available methods to gather needed data:

```ruby
# Leagues listing
OpenDotaApi.leagues

# Teams listing
OpenDotaApi.teams

# Match details
OpenDotaApi.match_by_id(match_id)

# Team details
OpenDotaApi.team_by_id(team_id)

# Team players
OpenDotaAPI.players_by_team_id(team_id)

#Team matches
OpenDotaAPI.matches_by_team_id(team_id)

# Player details
OpenDotaApi.player_by_id(player_id)

# Heroes listing
OpenDotaApi.heroes

# Pro players listing
OpenDotaApi.pro_players

# Explorer output (limited)
OpenDotaApi.explorer(league_id)

```

## Endpoints

#### :large_blue_diamond: Leagues

##### API Method: [leagues](https://docs.opendota.com/#tag/leagues)

```ruby
leagues = OpenDotaApi.leagues
leagues                # array
```
```ruby
league = leagues.first
league.class           # OpenDotaApi::League
```

```ruby
league.league_id       # Integer, league ID
league.ticket          # String, ticket identifier
league.banner          # String, banner identifier
league.tier            # String, premiere, pro, amateur
league.name            # String, league name

```
#### :large_blue_diamond: Teams

##### API Method: [teams](https://docs.opendota.com/#tag/teams)

```ruby
teams = OpenDotaApi.teams
teams                  # array
```

```ruby
team = teams.first
team.class             # OpenDotaApi::Team
```

```ruby
team.team_id           # Integer, team ID
team.rating            # Number, the Elo rating of the team
team.wins              # Integer, the number of games won by this team
team.losses            # Integer, the number of losses by this team
team.last_match_time   # Integer, the Unix timestamp of the last match played by this team
team.name              # String, team name, eg. 'Virtus Pro'
team.tag               # String, team tag/abbreviation, eg. 'VP'
team.logo_url          # String, team  logo url
```

```ruby
team.matches                    # array
team_match = team.matches.first
team_match.class                # OpenDotaApi::Teams::Match
team_match.league_id            # Integer, league ID
team_match.match_id             # Integer, match ID
team_match.radiant_win          # Boolean, whether or not the Radiant won the match
team_match.radiant              # Boolean, whether the match was on Radiant
team_match.duration             # Integer, length of the match
team_match.start_time           # Integer, Unix timestamp of when the match began
team_match.cluster              # Integer, cluster
team_match.opposing_team_id     # Integer, opposing team ID
team_match.opposing_team_name   # String, opposing team name
team_match.opposing_team_logo   # String, opposing team logo url
team_match.league_name          # String, name of league the match took place in
```

```ruby
team.players                        # array
team_player = team.players.first
team_player.class                   # OpenDotaApi::Teams::Player
team_player.account_id              # Integer, the player account ID
team_player.name                    # String, the player name
team_player.games_played            # Integer, number of games played
team_player.wins                    # Integer, number of wins
team_player.is_current_team_member  # Boolean, if this player is on the current roster
```

#### :large_blue_diamond: Matches

##### API Method: [matches](https://docs.opendota.com/#tag/matches)


```ruby
match_id = 0000000001        # Integer, match ID, is required
```

```ruby
match = OpenDotaApi.match_by_id(match_id)
match.class                  # OpenDotaApi::Match
```

```ruby
match.match_id                # Integer, the ID number of the match assigned by Valve
match.start_time              # Integer, the Unix timestamp at which the game started
match.duration                # Integer, duration of the game in seconds
match.series_id               # Integer, series ID
match.series_type             # Integer, series type
match.radiant_team_id         # Integer, the Radiant's team_id
match.dire_team_id            # Integer, the Dire's team_id
match.match_seq_num           # Integer, match seq num
match.league_id               # Integer, league ID
match.first_blood_time        # Integer, time in seconds at which first blood occurred
match.winner                  # Symbol, either :radiant or :dire
match.replay_salt             # Integer, replay salt
match.cluster                 # Integer, cluster
match.replay_url              # String, replay URL
match.radiant_score           # Integer, final score for Radiant (number of kills on Radiant)
match.dire_score              # Integer, final score for Dire (number of kills on Radiant)
match.radiant_gold_advantage  # Array, Radiant gold advantage at each minute in the game. A negative number means that Radiant is behind.
match.radiant_xp_advantage    # Array, Radiant experience advantage at each minute in the game. A negative number means that Radiant is behind.
match.players                 # array of players (type OpenDotaApi::Matches::Player)

```
##### :small_blue_diamond: Player

```ruby
players = match.players
player = players.first
player.class                # OpenDotaApi::Matches::Player
```

```ruby
player.match_id                 # Integer, related to OpenDotaApi::Match
player.player_slot              # Integer, which slot the player is in. 0-127 are Radiant, 128-255 are Dire
player.account_id               # Integer, account ID
player.assists                  # Integer, number of assists the player had
player.camps_stacked            # Integer, number of camps stacked
player.deaths                   # Integer, number of deaths
player.denies                   # Integer, number of denies
player.gold_per_min             # Integer, Gold Per Minute obtained by this player
player.hero_id                  # Integer, related to OpenDotaApi::Hero
player.kills                    # Integer, number of kills
player.obs_placed               # Integer, total number of observer wards placed
player.sen_placed               # Integer, how many sentries were placed by the player
player.rune_pickups             # Integer, number of runes picked up
player.stuns                    # Number, total stun duration of all stuns by the player
player.xp_per_min               # Integer, Experience Per Minute obtained by the player
player.name                     # String, name
player.side                     # Symbol, either :radiant or :dire
player.kda                      # Integer, KDA
player.tower_kills              # Integer, total number of tower kills the player had
player.roshan_kills             # Integer, total number of roshan kills (last hit on roshan) the player had
player.hero_healing             # Integer, Hero Healing Done
player.last_hits                # Integer, Number of last hits
player.firstblood_claimed       # Integer, first blood claimed
player.hero_damage              # Integer, Hero Damage Dealt
player.tower_damage             # Integer, Total tower damage done by the player
player.teamfight_participation  # Number, teamfight participation
player.actions_per_min          # Integer, Actions per minute
player.purchase                 # Hash, Object containing information on the items the player purchased
player.purchase_log             # Array, Object containing information on when items were purchased
player.purchase_time            # Hash, Object with information on when the player last purchased an item
player.killed                   # Hash, containing information about what units the player killed
player.kills_log                # Array, containing information on which hero the player killed at what time
player.ability_upgrades         # Array, describes how abilities were upgraded
player.xp_timings               # Array, Experience at each minute of the game
player.backpack_0               # Integer, Item in backpack slot 0
player.backpack_1               # Integer, Item in backpack slot 1
player.backpack_2               # Integer, Item in backpack slot 2
player.item_0                   # Integer, Item in the player's first slot
player.item_1                   # Integer, Item in the player's second slot
player.item_2                   # Integer, Item in the player's third slot
player.item_3                   # Integer, Item in the player's fourth slot
player.item_4                   # Integer, Item in the player's fifth slot
player.item_5                   # Integer, Item in the player's sixth slot
player.is_radiant               # Boolean, whether or not the player is on Radiant
player.radiant_win              # Boolean, indicating whether Radiant won the match
player.win                      # Binary integer, representing whether or not the player won
player.lose                     # Binary integer, representing whether or not the player lost

```

#### :large_blue_diamond: Heroes

##### API Method: [heroes](https://docs.opendota.com/#tag/heroes)


```ruby
heroes = OpenDotaApi.heroes
heroes.class              # array
```

```ruby
hero = heroes.first
hero.class                # OpenDotaApi::Hero
```
```ruby
hero.id                   # Integer, numeric identifier for the hero object
hero.name                 # String, dota hero command name, e.g. 'npc_dota_hero_antimage'
hero.localized_name       # String, hero name, e.g. 'Anti-Mage'
hero.primary_attr         # String, hero primary shorthand attribute name, e.g. 'agi'
hero.attack_type          # String, hero attack type, either 'Melee' or 'Ranged'
hero.legs                 # Integer, number of legs of the hero
hero.roles                # Array, hero's role in the game
```

#### :large_blue_diamond: Pro Players

##### API Method: [proPlayers](https://docs.opendota.com/#tag/proPlayers)


```ruby
pro_players = OpenDotaApi.pro_players
pro_players.class              # array
```

```ruby
pro_player = pro_players.first
pro_player.class               # OpenDotaApi::ProPlayer
```

```ruby
pro_player.account_id          # Integer, Player's account identifier
pro_player.steam_id            # String, Player's steam identifier
pro_player.avatar              # String, Steam picture URL (small picture)
pro_player.avatar_medium       # String, Steam picture URL (medium picture)
pro_player.avatar_full         # String, Steam picture URL (full picture)
pro_player.profile_url         # String, Steam profile URL
pro_player.persona_name        # String, Player's Steam name
pro_player.last_login          # Time, Date and time of last login to OpenDota
pro_player.full_history_time   # Time, Date and time of last request to refresh player's match history
pro_player.cheese              # Integer, Amount of dollars the player has donated to OpenDota
pro_player.fh_unavailable      # Boolean, Whether the refresh of player' match history failed
pro_player.loc_country_code    # String, Player's country identifier, e.g. US
pro_player.last_match_time     # Time, last match time
pro_player.name                # String, Verified player name, e.g. 'Miracle-'
pro_player.country_code        # String, Player's country code
pro_player.fantasy_role        # Integer, Player's ingame role (core: 1 or support: 2)
pro_player.team_id             # Integer, Player's team ID
pro_player.team_name           # String, Player's team name, e.g. 'Evil Geniuses'
pro_player.team_tag            # String, Player's team shorthand tag, e.g. 'EG'
pro_player.is_locked           # Boolean, Whether the roster lock is active
pro_player.is_pro              # Boolean, Whether the player is professional or not
pro_player.locked_until        # Integer, When the roster lock will end
```


#### :large_blue_diamond: Explorer

##### API Method: [explorer](https://docs.opendota.com/#tag/explorer)


```ruby
explorer = OpenDotaApi.explorer(league_id)
explorer.class                  # OpenDotaApi::Explorer
```

```ruby
explorer.league_matches_ids     # Array of matches IDs for current league
```
...

That's all for now.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/vergilet/open_dota_api

<img align="right" src="https://user-images.githubusercontent.com/2478436/28493917-7c3389c8-6f28-11e7-932e-da360b68f3d3.gif"/>

Feel free to contribute:
1. Fork it (https://github.com/vergilet/open_dota_api/fork)
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request



## License
The gem is available as open source under the terms of the MIT License.

Copyright © 2017 Yaro.

[![GitHub license](https://img.shields.io/dub/l/vibe-d.svg)](https://raw.githubusercontent.com/vergilet/open_dota_api/master/LICENSE)
