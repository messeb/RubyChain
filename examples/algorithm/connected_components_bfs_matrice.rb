#!/usr/bin/ruby

require_relative '../../lib/io/amreader'
require_relative '../../lib/vo/graph'
require_relative '../../lib/algorithm/breadthsearch'

file_name = '../files/Graph1.txt'

reader = AdjacencyMatriceReader.new :file => file_name
reader.read
edgelist = reader.to_edge_tuple

count = reader.verticesCount

g = Graph.new

0.upto(count-1) do |i|
	g.add_vertice(:value=>i)
end

edgelist.edges.each do |hash|
	g.add_edge :fromValue => hash[:from], :toValue => hash[:to]
	g.add_edge :fromValue => hash[:to], :toValue => hash[:from]
end

bfs = BreadthSearch.new :graph => g

total = []
components = []
i = 0

begin
	connection = g.diff :nodes => total
	if connection[0] != nil
		verts = bfs.search(connection[0])
		components << verts
		total = total + verts
	end
end while not connection.empty?

puts components.size

puts "\nKomponenten \n"
components.each do |c|
	puts c.size
end