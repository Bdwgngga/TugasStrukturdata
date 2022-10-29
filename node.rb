#MUHAMMAD BAGAS DEWANGGA
#2IA25
#50421929

class Node
	attr_accessor :value, :prevnode, :nextnode
	def initialize (value,prevnode,nextnode)
		@value = value
		@prevnode = prevnode 
		@nextnode = nextnode
	end
		
	def to_s
		if(@value.nil?)
			nil
		else
			@value.to_s
		end
	end
end