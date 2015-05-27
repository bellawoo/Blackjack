require 'pry'
require "./blackjack.rb"

# create deck and deal two cards each to player and dealer
GameDeck = Deck.new
dealer = Hand.new
player = Hand.new


# reveal one card of dealer's hand to player
dealer_hand = dealer.add(GameDeck.draw, GameDeck.draw)
# reveal two cards and sum to player'
player_hand = player.add(GameDeck.draw, GameDeck.draw).to_s
puts "Your hand: #{player_hand}"
puts "Dealer's second draw: #{dealer_hand[1]}"

# sum two cards
def Determine_21?
	
end

# if player cards = 21 --> win
# else --> ask if player wants to hit or stand

# HIT
# draw another card for player
# sum cards
# if = 21 --> win
# else --> ask if player wants to hit or stand
# repeat
def Hit
	
end

# STAND
# sum cards
# if = 21 --> win
# else --> return sum
def Stand
	
end

# Dealer hits
# sum cards
# if = 21 --> win
# else hits
# sum cards
# repeat until > 17

# compare player and dealer sums. larger sum wins.