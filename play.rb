require 'pry'
require "./DL_blackjack"

# create deck and deal two cards each to player and dealer
GameDeck = Deck.new
dealer = Hand.new
player = Hand.new
# dealer.add(GameDeck.draw, GameDeck.draw)
# player.add(GameDeck.draw, GameDeck.draw)

def begin_game
	
end

def reveal_hand
	current_hand = player.to_s
	puts "Your hand: #{current_hand}"
	dealer_hand = dealer.to_s
	puts "Dealer's second draw: #{dealer_hand}"
	score
	puts "Type \"hit\" or \"stand\" to continue."
	move = gets.chomp.downcase
	if move == "hit"
		Hit
	elsif move == "stand"
		Stand
	else
		puts "Not a valid option. Please try again. Hit or stand?"
	end
end


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
	if score == 21
		return true
	else
		if #dealer's sum is larger than score
	end
end

def score
	# sum two cards
	# if player cards = 21 --> win
	# else --> ask if player wants to hit or stand
	initial_score = current_hand.value
	puts "Your score so far: #{initial_score}"
end

system."clear"
puts "Would you like to play Blackjack?"
answer = gets.chomp.downcase
answer ? begin_game : puts "Goodbye."

# Dealer hits
# sum cards
# if = 21 --> win
# else hits
# sum cards
# repeat until > 17