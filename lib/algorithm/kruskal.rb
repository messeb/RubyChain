require 'set'

class Kruskal

	def initialize(parameter = {})
		o = {
			:graph => nil
		}.merge(parameter)
		@graph = o[:graph]
	end

	def get_edges
		edges = []
		vertices_sets = {}

		# sort Edges
		graph_edges = Array.new(@graph.edges)
		graph_edges.sort! { |a,b| a.costs.to_f <=> b.costs.to_f}

		# graph vertices
		vertices = @graph.vertices.values
		vertices.each do |v|
			vertices_sets[v] = Set.new [v]
		end

		graph_edges.each do |edge|
			if !vertices_sets[edge.fromNode].include?(edge.toNode)
			   
				edges << edge
	
			   	my_set = vertices_sets[edge.fromNode].merge(vertices_sets[edge.toNode])
			   	vertices_sets[edge.toNode].each do |v|
			   		vertices_sets[v] = my_set
				end
			end
		end

		return edges

	end
end