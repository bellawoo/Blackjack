require 'pry'
class Card
	def initialize rank, suit
		@rank = rank
		@suit = suit
	end

	def value
		# binding.pry
		if @rank == :K || @rank == :Q || @rank == :J
			return 10
		elsif @rank == :A
			return 1
		else
			return @rank
		end
	end
end

class Deck
	attr_reader :full_deck
	def initialize
		@types = [:A, 2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K]
		@suit = [:C, :D, :S, :H]
	end

	def cards
		full_deck = []
		full_deck.push(@types.product(@suit))
	end

	def draw
		drawn_card = []
		shuffled_deck = full_deck.shuffle!
		drawn_card.shift(shuffled_deck)
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