require_relative '../../lib/vo/value'
require_relative '../../lib/io/edgelistreader'
require_relative '../../lib/vo/graph'
require_relative '../../lib/algorithm/kruskal'

reader = EdgeListReader.new :file => '../files/G_1_2.txt'
edgelist = reader.readWithEdgeCosts

count = reader.verticesCount

g = Graph.new

0.upto(count-1) do |i|
	g.add_vertice(:value=>i)
end

edgelist.edges.each do |hash|
	# puts hash
	g.add_edge :fromValue => hash[:from], :toValue => hash[:to], :costs => hash[:costs]
	g.add_edge :fromValue => hash[:to], :toValue => hash[:from], :costs => hash[:costs]
end

kruskal = Kruskal.new :graph => g

result = kruskal.get_edges

costs = 0;
result.each do |edge|
	costs = costs + edge.costs.to_f
end

printf "%d Vertices, %.4f costs\n", result.size, costs
