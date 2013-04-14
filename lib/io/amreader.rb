require_relative '../vo/adjamat'
require_relative '../vo/edgetuplelist'

class AdjacencyMatriceReader

	attr_accessor :matrice
	attr_accessor :verticesCount

	def initialize(parameter = {})
		o = {
			:file => nil,
			:linesToSkip => 0,
			:firstLineVerticeCount => true
		}.merge(parameter)
		
		@filename = o[:file]
		@linesToSkip = o[:linesToSkip]
		@firstLineVerticeCount = o[:firstLineVerticeCount]

		@verticesCount = 0
	end

	def read
		@file = File.readlines @filename
	
		if @firstLineVerticeCount == true
			@verticesCount = @file[0].to_i
			@file.shift
		end

		@matrice = AdjacencyMatrice.new({:dimension => @verticesCount})

		for i in 1..@verticesCount do
			line = @file[i-1].to_s.split
			for j in 1..@verticesCount do
        		@matrice.add(:row => i-1, :column => j-1, :value => line[j-1])
			end
		end
	end

	def to_edge_tuple
		edge_list = EdgeTupleList.new

		for i in 0..@verticesCount-1 do
			for j in 0..@verticesCount-1 do
				if @matrice.elem(i, j).to_i != 0
		 			edge_list.add(:from => i, :to => j)
				end
			end
		end
		edge_list
	end
end