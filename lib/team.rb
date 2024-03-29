# frozen_string_literal: true

require_relative 'parsed_json'

# This class Parses the team portion of the game
class Team < ParsedJson
  attr_accessor :players

  def initialize(team_data)
    @players = parse_players(team_data.delete(:players))
    super(team_data)
  end

  # This method parses the player key, which is assumed to hold a hash of players
  # @param [Hash] players - The hash of players for the team
  # @return [Array] - Returns an Array of Player objects
  def parse_players(players)
    players.values.map { |player| Player.new(player) }
  end
end
