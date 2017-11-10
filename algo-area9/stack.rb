
# stack avec fonctions push, pop et min en O(1)


class Stack
	@min_index = []
	@stack = []


	def self.min 
		return nil if @min_index.empty?
		index = @min_index[@min_index.length - 1]
		return @stack[index]
	end

	def self.push elem
		@stack.push(elem)

		if @min_index.empty?
			@min_index.push(0) 
		elsif elem < min
			@min_index.push(@stack.length - 1)
		end
	end

	def self.pop 
		return nil if @stack.emtpy?

		if @min_index.last == @stack.length - 1
			@min_index.pop
		end
		return @stack.pop
	end
end


data = [2,3,4,1,5,6]

data.each do |e|
	Stack.push e
end

Stack.min


