load 'node.rb'
class Doublelist
	attr_accessor :head, :tail, :size

	def initialize
		@size=0
	end
	
	def add_Node (value)
		if @head.nil?
			@head=@tail=Node.new(value,nil,nil)
		else
			@tail.nextnode=Node.new(value,@tail,nil)
			@tail=tail.nextnode
		end
		@size+=1
	end
	def get_Node(number)
		if (number<=@size && number>=1)
			n=1
			node=@head
			while n<number
				node=node.nextnode
			n+=1
			end	
		node
		end
	end	
	
	def add_Node_After (number,value)
		node=get_Node(number)
		if node.nextnode.nil?
			self.addNode(value)
		else
			new_node=Node.new(value,nil,nil)
			new_node.nextnode=node.nextnode
			new_node.prevnode=node
			node.nextnode.prevnode=new_node
			node.nextnode=new_node
		end
		@size+=1
	end
	
	def add_Node_Before(number,value)
		node=get_Node(number)
		if node.prevnode.nil?
			new_node=Node.new(value,nil,nil)
			@head.prevnode=new_node
			new_node.nextnode=@head
			@head=new_node
		else
			new_node=Node.new(value,nil,nil)
			new_node.nextnode=node
			new_node.prevnode=node.prevnode
			node.prevnode.nextnode=new_node
			node.prevnode=new_node
		end
		@size+=1
	end
		
	def put_Node (number)
		puts "node ["+number.to_s+"] =" +get_Node(number).to_s
	end
	
	def del_Node (number)
		node=get_Node(number)
		if node.prevnode.nil?
			if (size == 1)
				@head=nil
					@tail=nil
			else
				node.nextnode.prevnode=nil
				@head=node.nextnode
			end
		end
		if node.nextnode.nil?
			node.prevnode.nextnode=nil
			@tail=node.prevnode		
		end
		if node.prevnode != nil && node.nextnode != nil
			node.prevnode.nextnode=node.nextnode
			node.nextnode.prevnode=node.prevnode
		end
		@size-=1
	end
					

	def to_s
	
		return "" unless @head
		node=@head
		result = "#{@head.value}"
		result +=" #{node.value}" while node=node.nextnode
		result
	end
end

Doublelist = Doublelist.new
Doublelist.add_Node(8)
Doublelist.add_Node(16)
Doublelist.add_Node(32)
Doublelist.add_Node(64)
Doublelist.add_Node(128)
Doublelist.add_Node(256)
puts Doublelist
Doublelist.del_Node(4)
puts Doublelist
Doublelist.add_Node_After(4,22)
puts Doublelist
Doublelist.add_Node_Before(4,44)
puts Doublelist
Doublelist.put_Node(4)
Doublelist.add_Node_Before(1,4)
puts Doublelist
Doublelist.del_Node(8)
puts Doublelist
Doublelist.del_Node(1)
puts Doublelist
Doublelist.put_Node(6)