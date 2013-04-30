require_relative '../../../lib/vo/value'
require_relative '../../../lib/io/edgelistreader'
require_relative '../../../lib/vo/graph'
require_relative '../../../lib/algorithm/tsp/brute_force'

reader = EdgeListReader.new :file => '../../files/K_12e.txt'
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

bf = BruteForce.new :graph => g
result, costs = bf.get_edges :start_node => g.vertices[0]

printf "%d Nodes, %.4f costs\n", result.size, costs
