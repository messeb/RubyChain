require_relative './vertex'
require_relative './edge'

class Graph
	attr_accessor :vertices
	attr_accessor :edges

	def initialize
		@vertices = {}
		@edges = Array.new
	end

	def add_vertice(parameter={})
		o = {:value => nil}.merge(parameter)

		@vertices[o[:value]] = Vertex.new(:value => o[:value])
	end

	def add_edge(parameter={})
		o = {
			:fromValue => nil,
			:toValue => nil,
			:costs => 0,
			:params => nil
		}.merge(parameter)

		fromNode = @vertices[o[:fromValue]]
		toNode = @vertices[o[:toValue]]

		edge = Edge.new(:fromNode => fromNode,
						:toNode => toNode,
						:costs => o[:costs],
						:params => o[:params])

		fromNode.edges << edge
		toNode.edges << edge

		@edges << edge
	end

	def diff(parameter={})
		o = {
			:nodes => nil
		}.merge(parameter)
	
		diff = @vertices.values - o[:nodes]
	end


	def self.createFromEdges(parameter = {})
		o = {
			:edges => nil
		}.merge(parameter)

		g = Graph.new

		edges = o[:edges];

		edges.each do |edge|
			fromVertex = edge.fromNode
			toVertex = edge.toNode

			if !g.vertices.has_key?(fromVertex.value.to_i)
				g.add_vertice(:value => fromVertex.value.to_i)
			end

			if !g.vertices.has_key?(toVertex.value.to_i)
				g.add_vertice(:value => toVertex.value.to_i)
			end

			g.add_edge :fromValue => edge.fromNode.value.to_i, :toValue => edge.toNode.value.to_i, :costs => edge.costs
			g.add_edge :fromValue => edge.toNode.value.to_i, :toValue => edge.fromNode.value.to_i, :costs => edge.costs
		end
		g
	end
end