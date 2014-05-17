require 'pry'
require_relative 'blackjack-game'

$chips = 100

def one_game_of_blackjack
  #setup
  $score = 0
  $bet = betting
  $outcome = dealing_cards

  $chips += $bet * 2.5 if $outcome == "blackjack"
  $chips += $bet * 2 if $outcome == "win"

  puts "You now have #{$chips} chips in your stack."

  play_blackjack?

end


def play_blackjack?
  puts "Do you want to play blackjack? (Press 'Y' for yes, 'N' for no)"
  answer = gets.chomp.downcase
  if answer == 'y'
    puts "you have #{$chips} chips in your stack."
    one_game_of_blackjack
  else
    puts "Then get lost pal!"
    return
  end
end



play_blackjack?