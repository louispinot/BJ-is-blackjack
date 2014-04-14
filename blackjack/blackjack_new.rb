require 'pry'

# def setup
#   $score = 0
#   $outcome = nil
# end

def betting
  begin
    begin
      puts "How much do you wish to bet?"
      bet = Integer(gets.chomp)
     # raise RangeError.new "Player cannot bet more than his:her number of chips" unless bet < chips
      #raise TypeError, 'Your bet has to be a number' unless bet.is_a? Integer
    rescue
      # puts "You don't have that kind of money." if RangeError
       puts 'Your bet has to be a number' if TypeError
       retry
    end
  end
  $chips -= bet
  bet
end

def dealing_cards

  $hand = []
  while $outcome == nil
    puts "Card ? (type 'Y' for a new card, 'N' to stop)"
    answer = gets.chomp.downcase
    if answer == 'y'
      pick_card
      game_status  #### calling a method called status
    else $outcome = "stop"
    end
  end

  if $outcome == "stop"  ### i.e. le joueur a décidé de s'arreter de tirer, attend de voir le score de la banque
    the_bank_plays
    if $bank_score > 21
      $outcome = "win"
      puts "The bank hit #{$bank_score}, you win!"
    elsif  $score > $bank_score
      $outcome = "win"
      puts "The Bank has #{$bank_score}: you won!"
    else
      $outcome = "lost"
      puts "The Bank has #{$bank_score}: you lost"
    end
  end

  $outcome
end

def pick_card

  cards = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, "Head", "Head", "Head", "Ace"]
  pick = cards.sample
  puts "You picked #{pick}"

  if pick == "Ace"          #### Que se passe-t-il si on sort un As ?
    if $hand == ["Head"]
      $score = 21
      $outcome = "blackjack"
    elsif $score + 11 > 21
      $score +=1
    else $score += 11
    end
  elsif pick == "Head"     #### Que se passe-t-il si on sort un Atout ?
    $score +=10
    puts "Possibilité de Black Jack!!" if $hand == []
  else
    $score += pick
  end
  $hand << pick
end

def game_status
  if $outcome == "blackjack"
    puts "Black Jack !!"
  elsif $score > 21
    $outcome = "lost"
    puts "You're over 21. You lost."
  else
    puts "Your score is now #{$score}."
  end
end

def the_bank_plays
  $bank_score = 0
  cards = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, "Ace"]
  while $bank_score < 17
    pick = cards.sample
    if pick == "Ace"
      ($bank_score + 11 > 21) ? $bank_score +=1 : $bank_score += 11
    else
      $bank_score += pick
    end
  end
  $bank_score
end











