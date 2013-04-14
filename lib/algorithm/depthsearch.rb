require_relative './search'
	class DepthSearch
		

		def initialize(parameter = {})
			o = {
				:graph => nil,
				:type => SearchTyp::EDGE_LIST
			}.merge(parameter)

			@graph = o[:graph]
			@type = o[:type]
		end

		def search(startVertices)
			visited_nodes = []

			self.rec_search(startVertices, visited_nodes)
			visited_nodes
		end

		def rec_search(start_vertice, visited_nodes)
			if !visited_nodes.include?(start_vertice)

				visited_nodes << start_vertice
				edges = start_vertice.out_edges

				edges.each do |edge|
					# if Abfrage ob Knoten in Liste
					rec_search(edge.toNode, visited_nodes)	
				end
			end				
		end
	end
