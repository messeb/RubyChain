class Value

	attr_accessor :intVal
	attr_accessor :fltVal
	attr_accessor :strVal

	def initialize(value=0)
		@intVal = value.to_i
		@fltVal = value.to_f
		@strVal = String(value)
	end

	def to_i
		@intVal
	end

	def to_f
		@fltVal
	end

	def to_s
		@strVal
	end

end