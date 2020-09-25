class Node

        attr_accessor :left , :right ,:val
        def initialize(val = nil)
                @val = val
                @left=nil;
                @right=nil;
        end
end

class Tree 
    	
	attr_accessor :root
    
	def initialize 
		@root=nil;
	end
  

	def insert(val1)
		if @root == nil
			@root = get_new_node(val1)
		else
			_insert(@root,val1)
		end
	end

	def _insert(node,val2)
	  
		if (node == nil)
			return get_new_node(val2)
		elsif(node.val > val2)
			node.left = _insert(node.left,val2)
		else
			node.right = _insert(node.right,val2)
		end
      
		return node
       	end

	def search(val3,node1=nil)
    
		return false if node1.nil?

		if node1.val == val3
			return true
    		elsif val3 < node1.val
			search(val3,node1.left)
    		elsif val3 > node1.val
       			search(val3,node1.right)
		else
       			return false   
		end
 
	end

	def _post(node)
		
		return nil if node.nil?
		
		_post(node.left)
		_post(node.right)
		puts(node.val)
	end
 
	def _in(node)

		return nil if node.nil?
	 
		_in(node.left)
		puts(node.val)
		_in(node.right)
	end

	def _pre(node)
  
		return nil if node.nil?
     
		puts(node.val)
		_pre(node.left)
		_pre(node.right)

	end

	def _height(node)
	
		if node==null
			return 0
		else
			lh=height(node.left)
			lr=height(node.right)

			if lh > rh
				return lh+1
			else
				return rh+1
			end
		end
	end

	def _print_level(node)
		h=_height(node).to_i
		i=1;
		h.times{ bft(node,i); i+=1; }
	end

	def bft(node,level)
   
		return nil if node==nil

		if level == 1
			puts(node.val)
		elsif (level>1) 
			bft(node.left,level-1)
			bft(node.right,level-1)
		end
	end

	def _inorder_sucessor(node) # Finds the inorder Sucessor to be replaced with the deleted node
	
		if node.left.nil?
			return node 
		else
			_inorder_sucessor(node.left)
		end
		
	end

	def delete_search(node,val) # Finds the node in the tree foer the given value
	  
		if node.val == val
			return node
		elsif node.val > val
			delete_search(node.left,val)
		elsif node.val < val
			delete_search(node.right,val)
		end
	end

	def delete(node,val) # Gets the input value for the node to be deleted

		return nil  if node.nil?
		
		node1=delete_search(node,val)
		_delete(node1)
	end

	def _delete(node) # Deletes the node depend upon the value

		

		if node.left==nil && node.right == nil
			node=nil
		elsif node.left!=nil && node.right==nil
			node=node.left
			node.left=nil
		elsif  node.left==nil && node.right!=nil
			node=node.right
			node.right=nil
		else 
			 _delete_double(node)
		end

	end

	def _delete_double(node) # Function to delete if the node has two children
 
		replace_node= _inorder_sucessor(node) # Finds the inorder sucessor
		node.val=replace_node.val# Replaces the node with inorder sucessor and delete's the inorder sucessor node
		replace_node=nil
	end

	private
		def get_new_node(node)
			return Node.new(node)
		end

 
end

bst = Tree.new()

#Binay Tree creation
puts ();
bst.insert(50)
bst.insert(30)
bst.insert(20)
bst.insert(40)
bst.insert(70)
bst.insert(60)
bst.insert(80)

puts "Full tree"
bst._in(bst.root)

bst.delete(bst.root,20)
puts("tree without 20")
bst._in(bst.root)

bst.delete(bst.root,30)
puts("tree without 30")
bst._in(bst.root)

bst.delete(bst.root,50)
puts("tree without  50")
bst._in(bst.root)
