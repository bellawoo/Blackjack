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
		cards.shuffle!.shift
	end

	def drawn
		cards_drawn = []
		cards_drawn.push(draw)
	end
end

class Hand
	def initialize
		@hand = 0
	end

	# stuck on how to iterate through multidimensional arrays for just the first index of each array
	def add *cards
		value = 0
		Deck.drawn.each do |cards|
			value += cards
		end
		value
	end

	def value 
		# push total add return to @hand
	end

	def busted?
		true if @hand > 21
	end

	def blackjack?
		true if @hand == 21
	end

end