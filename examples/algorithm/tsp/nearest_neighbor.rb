require_relative '../../../lib/vo/value'
require_relative '../../../lib/io/edgelistreader'
require_relative '../../../lib/vo/graph'
require_relative '../../../lib/algorithm/tsp/nearest_neighbor'

reader = EdgeListReader.new :file => '../../files/K_100.txt'
edgelist = reader.readWithEdgeCosts

count = reader.verticesCount

g = Graph.new

0.upto(count-1) do |i|
	g.add_vertice(:value=>i)
end

edgelist.edges.each do |hash|
	g.add_edge :fromValue => hash[:from], :toValue => hash[:to], :costs => hash[:costs]
	g.add_edge :fromValue => hash[:to], :toValue => hash[:from], :costs => hash[:costs]
end

nearest_neighbor = NearestNeighbor.new :graph => g
result = nearest_neighbor.get_edges :start_node => g.vertices[0]

costs = 0;
result.each do |edge|
	costs = costs + edge.costs.to_f
end

result.each do |edge|
	printf "%d => %d (%f)\n", edge.fromNode.value, edge.toNode.value, edge.costs
end

printf "%d Edges, %.4f costs\n", result.size, costs
