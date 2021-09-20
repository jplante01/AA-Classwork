class PolyTreeNode
  attr_reader :children, :value, :parent
  def initialize(value)
    @parent = nil
    @children = []
    @value = value
  end
  
  def parent=(other_node)
    @parent = other_node
    other_node.children << self

    
  end

end

#set parent on instance
#pass in the parent object