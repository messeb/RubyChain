require_relative '../kruskal'
require_relative '../depthsearch'

class DoubleTree

	def initialize(parameter={})
		o = {
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

		# create MST
		mst = Kruskal.new :graph => @graph
		result = mst.get_edges

		g = Graph.createFromEdges :edges => result

		# depth search on MST
		dfs = DepthSearch.new :graph => g
		result_vertices = dfs.search g.vertices[0]

		first_vertex = nil
		last_vertex = nil

		result_vertices.each do |vertex|

			org_vertex = @graph.vertices[vertex.value.to_i]

			if nil == first_vertex
				first_vertex = org_vertex
			else
				last_vertex.out_edges.each do |edge|
					if edge.toNode == org_vertex
						result_edges << edge 
						break
					end

				end
			end
			last_vertex = org_vertex
		end

		last_vertex.out_edges.each do |edge|
			if edge.toNode == o[:start_node]
				result_edges << edge 
				break
			end
		end
		result_edges
	end
end