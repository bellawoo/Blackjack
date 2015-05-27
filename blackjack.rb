require 'pry'

class Card
	attr_reader :rank, :suit

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
		@cards = @types.product(@suit).shuffle!
		@cards_drawn = []
	end

	def cards
		@cards
	end

	def draw
		c = @cards.shift
		@cards_drawn.push(c)
		return c
	end

	def drawn
		@cards_drawn
	end
end

class Hand
	def initialize
		@cards_in_hand = []
	end
#
	def add *cards
		cards.each do |card|
			@cards_in_hand.push(card)
		end
	end

	def value 
		# push total add return to @hand_value
		@hand_value = 0
		@cards_in_hand.each do |card|
			@hand_value += card.value
		end
		if @hand_value < 12 && has_ace?
			@hand_value += 10
		else
			@hand_value
		end
	end

	def has_ace?
		@cards_in_hand.each do |card|
			if card.rank == :A
				return true
			end
		end
		return false
	end

	def busted?
		value > 21 ? true : false
	end

	def blackjack?
		@card_values = []
		@cards_in_hand.each do |card|
			@card_values.push(card.value)
		end
		if @card_values.include?(1) && @card_values.include?(10)
			return true
		else
			false
		end
	end

	def to_s
		@string_array = []
		@cards_in_hand.each do|card|
			@string_array.push(card.rank.to_s,card.suit.to_s)
		end
		@string_array = @string_array.each_slice(2).map { |a| a.join }
		@string_array.join(", ")
	end
end