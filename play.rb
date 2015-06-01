require 'pry'
require "./DL_blackjack"

# initialize game
gameDeck = Deck.new
dealer = Hand.new
player = Hand.new

# deal initial hands
dealer.add(gameDeck.draw, gameDeck.draw)
player.add(gameDeck.draw, gameDeck.draw)

# reveal hands without dealer's value
def reveal_hand
	puts "Your hand: #{player.to_s} Hand value: #{player.value}"
	puts "Dealer's second draw: #{dealer.to_s.slice(0..1)}"
end

def Hit_or_stand
	move = gets.chomp.downcase
	until player.busted? || move == "stand" do
		reveal_hand
		puts "Would you like to hit or stand?"
		puts "Type \"hit\" or \"stand\" to continue."
			if move == "hit"
				player.add(gameDeck.draw)
				reveal_hand
			else
				puts "Not a valid option. Please try again. Hit or stand?"
			end
	end
end

system "clear"
puts "Would you like to play Blackjack? Y/N"
answer = gets.chomp.downcase
if answer == "y"
	Hit_or_stand
elsif "n"
	puts "Goodbye."
	system "clear"
else
	puts "Not a valid option. Please type yes or no."
	answer = gets.chomp.downcase
end

# both players begin as 'not winning'
player_wins = false
dealer_wins = false

# when neither players have hit blackjack, we need to continue asking the player whether they want to hit/stand
if !player.blackjack? && !dealer.blackjack?
	until player.busted? || player_wins
		Hit_or_stand player, dealer
	end
	#  auto deal to the dealer until it hits hard 17
	until dealer.value >= 17 || dealer.busted? || player.busted? do
		dealer.add(gameDeck.draw)
	end
# when dealer has blackjack, switch to win, otherwise player wins
else
	if dealer.blackjack?
	dealer_wins = true
	puts "Dealer wins!"
	else
		player_wins = true
		puts "Player wins!"
	end
end

if player.busted?
	dealer_wins = true
	reveal_hand player, dealer
	puts "Player busted. Dealer wins."
elsif dealer.busted?
	player_wins = true
	reveal_hand player, dealer
	puts "Dealer busts."
elsif player.value == dealer.value
	reveal_hand player, dealer
	puts "Push. Player and dealer hands are same amount."
elsif player.value > dealer.value
	player_wins = true
	puts "Player wins!"
elsif player.value < dealer.value
	dealer_wins = true
	puts "Dealer wins!"		
end