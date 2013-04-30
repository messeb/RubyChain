class BruteForce
	
	def initialize(parameter = {})
		o = {
			:graph => nil
		}.merge(parameter)

		@graph = o[:graph]
		@mincosts = Float::INFINITY
		@minvertices = []
		@min_edges = []
	end

	def get_edges(parameter={})
		o = {
			:start_node => nil
		}.merge(parameter)

		rec_get_edges(o[:start_node], [o[:start_node]])
	end

	def rec_get_edges(vertex, visited=[], costs=0.0)
		edges = vertex.out_edges
		edges.each do |edge|
			if !visited.include?(edge.toNode)
				new_costs = costs + edge.costs.to_f

				if new_costs < @mincosts
					new_visited = visited.clone
					new_visited << edge.toNode
					@min_edges << edge
					rec_get_edges(edge.toNode, new_visited, new_costs)
				end
			end

			if visited.size == @graph.vertices.values.size 
				visited << edge.toNode
				costs = costs + edge.costs.to_f
				@min_edges << edge
			end

			if costs < @mincosts && visited.size == @graph.vertices.values.size + 1
				@mincosts = costs
				@minvertices = visited.clone
				printf "%d %f\n", visited.size, @mincosts
			end
		end

		return @minvertices, @mincosts
	end
end