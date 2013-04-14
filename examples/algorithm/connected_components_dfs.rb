#!/usr/bin/ruby

require_relative '../../lib/io/edgelistreader'
require_relative '../../lib/vo/graph'
require_relative '../../lib/algorithm/depthsearch'

# file_name = '../files/Graph2.txt'
# file_name = '../files/Graph3.txt'
file_name = '../files/Graph4.txt'

reader = EdgeListReader.new :file => file_name
adjalist = reader.read

count = reader.verticesCount

g = Graph.new

0.upto(count-1) do |i|
	g.add_vertice(:value=>i)
end

adjalist.edges.each do |hash|
	g.add_edge :fromValue => hash[:from], :toValue => hash[:to]
	g.add_edge :fromValue => hash[:to], :toValue => hash[:from]
end

dfs = DepthSearch.new :graph => g

total = []
components = []
i = 0
begin
	connection = g.diff :nodes => total
	if connection[0] != nil
		verts = dfs.search(connection[0])
		components << verts
		total = total + verts
	end
end while not connection.empty?

puts components.size

puts "\nKomponenten \n"
components.each do |c|
	puts c.size
end