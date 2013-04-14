require_relative './edge' 
require_relative './value'

class Vertex
  
  attr_accessor :value
  attr_accessor :edges

  def initialize(parameter = {})
    o = {:value => nil}.merge(parameter)
    @value = Value.new(o[:value])
  	@edges = []
  end

  def addVertex(parameter = {})
  	o = {
  		:value => nil,
  		:edge_costs => 0
  	}.merge(parameter)
  	
  	edge =  Edge.new(
          :fromNode => self,
  				:toNode => Vertex.new(o[:value]), 
  				:costs => o[:edge_costs])

    edge.toNode.edges << edge
    @edges << edge

  end 

  def out_edges
    out_edges = []

    @edges.each do |edge|
      if edge.is_start?(:node=>self)
        out_edges << edge
      end
    end
    out_edges
  end

  def in_edges
        out_edges = []

    @edges.each do |edge|
      if edge.is_end?(:node=>self)
        out_edges << edge
      end
    end
    out_edges
  end

end