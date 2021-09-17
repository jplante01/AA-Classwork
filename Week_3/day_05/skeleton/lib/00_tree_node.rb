class PolyTreeNode
  attr_reader :value, :parent,  :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=
    # self.parent = self.new
  end
  
  # def c
end