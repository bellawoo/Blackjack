require 'pry'
require "./blackjack"

# create deck and deal two cards each to player and dealer
GameDeck = Deck.new
dealer = Hand.new
player = Hand.new
dealer.add(GameDeck.draw, GameDeck.draw)
player.add(GameDeck.draw, GameDeck.draw)

def reveal_hand player, dealer
	# reveal two cards and sum to player'
	# reveal one card of dealer's hand to player

	puts "Your hand: #{player.to_s}"
	puts "Dealer's second draw: #{dealer}"
end

binding.pry

# sum two cards
initial_score = player.value
puts "Your score so far: #{initial_score}"

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