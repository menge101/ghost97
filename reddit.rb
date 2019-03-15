require_relative 'game_data'
require_relative 'lib/game'

# Ghost's initial method
def big_shoe_rebounds(h)
  #will return the number of rebounds associated with the player that has the largest shoe size
  # STEP1: find the player with the biggest shoe size
  #STEP 2: return that players number of rebounds
  h.each do |team, data|
    data.each do |attribute, values|
      if attribute == :players
        values.each do |player_number, player_data|
          if player_data == [:shoe_size].max
            return h[team][attribute][player_number][:rebounds]
          end
        end
      end
    end
  end
end

# big_shoe_rebounds(GAME_HASH)

def output_msg(player)
  puts "#{player.name}, has shoe size: #{player.shoe_size}, and #{player.rebounds} rebounds"
end

game = Game.new(GAME_HASH)
players = game.all_players
biggest_shoe = players.max { |a, b| a.shoe_size <=> b.shoe_size }
output_msg(biggest_shoe)
