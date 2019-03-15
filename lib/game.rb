# frozen_string_literal: true

require_relative 'parsed_json'

class Game < ParsedJson
  def initialize(**kwargs)
    kwargs.each do |key, value|
      instance_variable_set(normalize_key(key), Team.new(value))
      self.class.attr_accessor key.to_sym
    end
  end

  def all_players
    @away.players + @home.players
  end
end

class Player < ParsedJson; end

class Team < ParsedJson
  attr_accessor :players

  def initialize(**kwargs)
    @players = parse_players(kwargs.delete(:players))
    super(kwargs)
  end

  def parse_players(players)
    players.values.map { |player| Player.new(player) }
  end
end
