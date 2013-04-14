require_relative './search'

class BreadthSearch
	
	def initialize(parameter = {})
		o = {
			:graph => nil,
			:type => SearchTyp::EDGE_LIST
		}.merge(parameter)

		@graph = o[:graph]
		@type = o[:type]
	end

	def search(start_node)
		visited_nodes = []
		q = []

		q.push(start_node)
		visited_nodes << start_node

		begin
			vertice = q.shift
			vertice.edges.each do |edge|
				node = edge.toNode
				if !visited_nodes.include?(node)
					visited_nodes << node
					q << node
				end
			end
		end while not q.empty?

		visited_nodes
	end
end