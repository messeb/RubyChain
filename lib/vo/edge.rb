  class Edge
  
  attr_reader :costs
  attr_reader :toNode
  attr_reader :fromNode
  attr_accessor :params

  def initialize(parameter={})
  	o = {
      :fromNode => nil,
  		:toNode => nil,
  		:costs => 0,
  		:params => nil
  	}.merge(parameter)
    
    @params = o[:params]
    @toNode = o[:toNode]
    @fromNode = o[:fromNode] 
    @costs = o[:costs]
  end

  def is_loop?
    @fromNode == @toNode
  end

  def is_target? (parameter={})
    o = {
      :node => nil
    }.merge(parameter)

    @fromNode == o[:node] || @toNode == o[:node]
  end


  # Checks the connection of two nodes above this
  # edge
  def is_connected?(parameter={})
    o = {
        :from => nil,
        :to => nil
      }.merge(parameter)

      @fromNode == o[:from] && @toNode == o[:to] ||
      @fromNode == o[:to] && @toNode == o[:from]
  end

  def is_start?(parameter={})
    o = {
          :node => nil
        }.merge(parameter)

    if @fromNode == o[:node]
      true
    else
      false
    end
  end

  def is_end?(parameter={})
    o = {
          :node => nil
        }.merge(parameter)

    if @toNode == o[:node]
      true
    else
      false
    end
  end

end