class EdgeTupleList
	attr_accessor :edges

	def initialize
		@edges = []
	end

	def add(parameter={})
		o = {
			:from => nil,
			:to => nil,
			:costs => 0
		}.merge(parameter)

		@edges << {:from => o[:from], :to => o[:to], :costs => o[:costs] }
	end
	
end