#!/usr/bin/ruby
require_relative '../../lib/io/amreader'

am = AdjacencyMatriceReader.new :file => '../files/Graph1.txt'
mat = am.read
edge_tuples = am.to_edge_tuple
	
edge_tuples.edges.each  do |edge|
	printf "%s => %s\n", edge[:from], edge[:to]
end