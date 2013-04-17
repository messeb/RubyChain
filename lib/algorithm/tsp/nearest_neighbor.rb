require 'priority_queue'

class NearestNeighbor

	def initialize(parameter = {})
		o  = {
			:graph => nil
		}.merge(parameter)

		@graph = o[:graph]
	end

	def get_edges(parameter={})
		o = {
			:start_node => nil
		}.merge(parameter)

		current_vertex = o[:start_node]
		result_edges = []

		unvisited_vertices = []
		unvisited_vertices.concat(@graph.vertices.values)
		unvisited_vertices.delete o[:start_node]

		while not unvisited_vertices.empty?

			edges = current_vertex.out_edges
			prio_edges = PriorityQueue.new

			edges.each do |edge|
				prio_edges.push edge, edge.costs
			end

			begin
				min_edge = prio_edges.delete_min_return_key
			end while not unvisited_vertices.include? min_edge.toNode

			result_edges << min_edge

			current_vertex = min_edge.toNode
			unvisited_vertices.delete current_vertex
		end

		current_vertex.edges.each do |edge|
			if edge.toNode == o[:start_node]
				result_edges << edge 
				break
			end
		end

		result_edges
	end

end