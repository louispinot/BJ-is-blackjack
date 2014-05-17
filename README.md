# A simple Blackjack game in the terminal
===============

## Intro

I wrote this program  to get practice on the single responsability principle and its implications: in terms of nesting methods within each other and variable scopes.

It's a very good exercize I thought because the logic of the game flow is very strict so it requires to be very rigorous too.

I really tried to match the real situation of the game. It includes most of the rules and displays very detailed prompts for all situations

## blackjack-interface.rb

#### This is what you run. Here's what it does:

- It calls the play_blackjack? method that asks you if you want to play, and calls the one_game_of_blackjack method if you answer 'y'
- The one_game_of_blackjack method first sets all the relevant global variables :
  1. $score: the player's hand
  2. $bet : this calls the betting method which allows to bet, checks for errors and returns the bet
  3. &outcome: the state of the game, that also calls the dealing_cards method in blackjack-game.rb

- Then, after the game has been lost or won, the one_game_of_blackjack method updates the player's stack of chips and launches play_blackjack again.

One of the interesting things I found in this file was to call each method from within each other to launch the cascade of game methods and have the game repeat itself until the player decides to stop

## blackjack-game.rb

#### This is the engine, it handles all he game flow!

- betting method: allows to bet, check for errors and returns the bet
- dealing_cards method : asks the player if he wants to pick a card (which triggers the pick_card method) until he decides to stop or goes over 21. Returns the outcome of the game
- pick_card : randomly picks card and triggers all the actions that are automatic automatic according to the game's rule depending on the situation
- game_status:
-the_bank_plays: