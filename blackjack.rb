require 'pry'
class Card
	def initialize rank, suit
		@rank = rank
		@suit = suit
	end

	def value
		if [:J, :Q, :K].include? @rank
			return 10
		elsif @rank == :A
			return 1
		else
			return @rank
		end
	end
end

class Deck
	def initialize
		@types = [:A, 2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K]
		@suit = [:C, :D, :S, :H]
	end

	def cards
		@types.product(@suit)
	end

	def draw
		shuffled_deck = cards.shuffle!
		shuffled_deck.shift
	end
end

class Hand
	def initialize
		@hand = []
	end

	def value
		
	end

	def busted?
		
	end

	def blackjack?
		
	end

end