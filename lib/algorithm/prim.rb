require 'priority_queue'

class Prim

	def initialize(parameter)
		o = {
			:graph => nil
		}.merge(parameter)

		queue = []
		parent = []

		@graph = o[:graph]
	end

	def get_edges(parameter = {})
		o = {
				:start_node => @graph.vertices[0]

			}.merge(parameter)

		# MST edges
		edges = []

		unvisited_vertices = []
		unvisited_vertices.concat(@graph.vertices.values)
		unvisited_vertices.delete o[:start_node]

		prio_edges = PriorityQueue.new

		current_vertex = o[:start_node]
		while not unvisited_vertices.empty?
			# add every outgoing egdes to priority list
			current_vertex.out_edges.each do |e|
				if unvisited_vertices.include? e.toNode
					prio_edges.push e, e.costs.to_f
				end
			end

			# get min edge to unvisited node
			begin
				min_edge = prio_edges.delete_min_return_key
			end while not unvisited_vertices.include? min_edge.toNode
			
			edges << min_edge

			current_vertex = min_edge.toNode
			unvisited_vertices.delete current_vertex
		end

		edges
	end
end