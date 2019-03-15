# frozen_string_literal: true

require_relative 'parsed_json'
require_relative 'player'
require_relative 'team'

# This class parses the Game hash into Teams
class Game < ParsedJson
  def initialize(**kwargs)
    kwargs.each do |key, value|
      instance_variable_set(normalize_key(key), Team.new(value))
      self.class.attr_accessor key.to_sym
    end
  end

  # This method returns players from all Teams
  # An assumption that all instance variables of objects instantiated of this class will be teams having #players
  # @return [Array] Returns an array of players
  def all_players
    instance_variables.map { |var| instance_variable_get(var) }.reduce([]) { |acc, team| acc + team.players }
  end
end
