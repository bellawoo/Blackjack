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

class Deck < Card
	attr_reader :cards

	def initialize
		
	end

	def count
		
	end

	def draw
		
	end

	def drawn_card
		
	end
end

# class Hand
# 	def value
		
# 	end

# 	def busted?
		
# 	end

# 	def blackjack?
		
# 	end

# end