require "byebug"

class PolyTreeNode
    attr_reader :value, :parent, :children

    def initialize(value)
        @value = value
        @parent = nil 
        @children = [] 
    end
        def inspect
            @value
        end

    def parent=(node)
        self.parent.children.delete(self) if @parent
        @parent = node 
        self.parent.children << self if @parent
    end 

   def add_child(child_node)
        child_node.parent= self
    end
   
   def remove_child(child_node)
        raise "The kid is not my son!" unless child_node.parent
        child_node.parent= nil
    end


    def dfs(target_value)
        return self if self.value == target_value

        self.children.each do |child|
            match = child.dfs(target_value)
            return match if match 
        end

        nil 
    end

    # def get_children(children)
    #     #debugger
    #     grand_children = []
    #     self.children.each {|child| grand_children << child}
    #     return grand_children
    # end 

    def bfs(target_value)
        return self if self.value == target_value
        self.children.each {|child| return child if child.value == target_value}
        children = [self]
        
        until children.empty?# || child.value == target_value
            child = children.shift
            #debugger
            return child if child.value == target_value
            children.concat(child.children)
            #children.push(child.children)
        end
        nil
    end
end