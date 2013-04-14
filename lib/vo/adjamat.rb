class AdjacencyMatrice
	
	attr_accessor :matrice

	def initialize (parameter = {})
		o = {
			:dimension => 0
		}.merge(parameter)

		dim = o[:dimension]

		@matrice = Array.new(dim) { Array.new (dim) }
	end


	def isSym?
		sym = true
		for i in 0..@matrice.size-1 do 
			for j in 0..@matrice.size-1 do
				if @matrice[i][j] != @matrice[j][i]
					sym = false
				end
			end
		end
		sym
	end

	def add(parameter = {})
		o = {
			:row => 0,
			:column => 0,
			:value => 0
		}.merge(parameter)

		row = o[:row]
		column = o[:column]
		value = o[:value]

		@matrice[row][column] = value
	end

	def elem(i, j)
		@matrice[i][j]
	end
end