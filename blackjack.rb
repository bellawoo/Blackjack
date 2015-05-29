require 'pry'

class Card
	attr_reader :rank, :suit, :face_value

	def initialize rank, suit
		@rank = rank
		@suit = suit
		@face_value = @rank
	end

	def value
		if [:J, :Q, :K].include? @rank
			return 10
		elsif @rank == :A
			return 1
		else
			@rank
		end
	end

	def to_s
		"#{@face_value}#{suit}"
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
			@hand_value += card.rank
		end
		if @hand_value < 12 && has_ace?
			@hand_value += 10
		else
			@hand_value
		end
	end

	def has_ace?
		@cards_in_hand.any? do |card|
			card.face_value == :A
		end
	end

	def busted?
		value > 21
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
		@cards = @cards_in_hand
		@cards.map { |a| a.to_s }.join(", ")
	end
end