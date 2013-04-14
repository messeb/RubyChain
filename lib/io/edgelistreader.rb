require_relative '../vo/edgetuplelist'

class EdgeListReader
	
	attr_reader :verticesCount

	def initialize(parameter = {})
		o = {
			:file => nil,
			:linesToSkip => 0,
			:firstLineVerticeCount => true
		}.merge(parameter)

		@filename = o[:file]
		@linesToSkip = o[:linesToSkip]
		@firstLineVerticeCount = o[:firstLineVerticeCount]

		@verticesCount = 0
		@edgeList = EdgeTupleList.new

	end

	def read
		@file = File.readlines @filename
	
		if @firstLineVerticeCount == true
			@verticesCount = @file[0].to_i
			@file.shift
		end 

		@file.each do |line|
			node1, node2 = line.split
			@edgeList.add(:from => node1.to_i, :to => node2.to_i)
		end
		@edgeList	
	end

	def readWithEdgeCosts
		@file = File.readlines @filename
	
		if @firstLineVerticeCount == true
			@verticesCount = @file[0].to_i
			@file.shift
		end 

		@file.each do |line|
			node1, node2, costs = line.split
			@edgeList.add(:from => node1.to_i, :to => node2.to_i, :costs => costs)
		end
		@edgeList

	end
end